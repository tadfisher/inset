#[macro_use]
extern crate error_chain;
extern crate itertools;
extern crate xcb;

#[macro_use]
mod macros;
mod error;

use error::*;
use itertools::Itertools;

fn screen(conn: &xcb::Connection) -> Result<xcb::Screen> {
    conn.get_setup().roots().next().ok_or_else(|| {
        ErrorKind::XcbNoScreenError(()).into()
    })
}

// Get information about specified output
fn screen_info(
    conn: &xcb::Connection,
    query_output_name: Option<String>,
) -> ::std::result::Result<xcb::Reply<xcb::ffi::randr::xcb_randr_get_crtc_info_reply_t>, XError> {
    let root = screen(conn).expect("Root screen not found").root();

    // Return the default screen when no output is specified
    if query_output_name.is_none() {
        return primary_screen_info(conn, root);
    }
    let query_output_name = query_output_name.unwrap(); // Safe unwrap

    // Load screen resources of the root window
    // Return result on error
    let res_cookie = xcb::randr::get_screen_resources(conn, root);
    let res_reply = res_cookie.get_reply().expect(
        "Unable to get screen resources",
    );

    // Get all crtcs from the reply
    let crtcs = res_reply.crtcs();

    for crtc in crtcs {
        // Get info about crtc
        let crtc_info_cookie = xcb::randr::get_crtc_info(conn, *crtc, 0);
        let crtc_info_reply = crtc_info_cookie.get_reply();

        if let Ok(reply) = crtc_info_reply {
            // Skip this crtc if it has no width or output
            if reply.width() == 0 || reply.num_outputs() == 0 {
                continue;
            }

            // Get info of crtc's first output for output name
            let output = reply.outputs()[0];
            let output_info_cookie = xcb::randr::get_output_info(conn, output, 0);
            let output_info_reply = output_info_cookie.get_reply();

            // Get the name of the first output
            let mut output_name = String::new();
            if let Ok(output_info_reply) = output_info_reply {
                output_name = String::from_utf8_lossy(output_info_reply.name()).into();
            }

            // If the output name is the requested name, return the dimensions
            if output_name == query_output_name {
                return Ok(reply);
            }
        }
    }

    Err(XErrorKind::OutputNotFound.into())
}

// Get information about the primary output
fn primary_screen_info(
    conn: &xcb::Connection,
    root: u32,
) -> ::std::result::Result<xcb::Reply<xcb::ffi::randr::xcb_randr_get_crtc_info_reply_t>, XError> {
    // Load primary output
    let output_cookie = xcb::randr::get_output_primary(conn, root);
    let output_reply = output_cookie.get_reply().expect(
        "Unable to find primary output",
    );
    let output = output_reply.output();

    // Get crtc of primary output
    let output_info_cookie = xcb::randr::get_output_info(conn, output, 0);
    let output_info_reply = output_info_cookie.get_reply().map_err(|_| {
        XErrorKind::NoPrimaryOutput
    })?;
    let crtc = output_info_reply.crtc();

    // Get info of primary output's crtc
    let crtc_info_cookie = xcb::randr::get_crtc_info(conn, crtc, 0);
    Ok(crtc_info_cookie.get_reply().expect(
        "Unable to get primary output crtc information",
    ))
}

fn main() {
    let insets: Vec<u16> = std::env::args()
        .skip(1)
        .map(|a| match a.parse::<u16>() {
            Ok(n) => n,
            Err(_) => {
                eprintln!("Invalid inset value '{}'", a);
                std::process::exit(1);
            }
        })
        .pad_using(4, |_| 0)
        .collect();

    let (conn, _) = xcb::Connection::connect(None).unwrap();

    let info = screen_info(&conn, None).unwrap();

    let screen = screen(&conn).expect("Root screen not found");

    let window = conn.generate_id();

    xcb::create_window(
        &conn,
        xcb::WINDOW_CLASS_COPY_FROM_PARENT as u8,
        window,
        screen.root(),
        0,
        0,
        1,
        1,
        0,
        xcb::WINDOW_CLASS_INPUT_OUTPUT as u16,
        screen.root_visual(),
        &[],
    );

    let left = u32::from(insets[0]);
    let right = u32::from(insets[1]);
    let top = u32::from(insets[2]);
    let bottom = u32::from(insets[3]);
    let end_x = u32::from(info.width()) - 1;
    let end_y = u32::from(info.height()) - 1;

    let strut = [
        left,
        right,
        top,
        bottom,
        0,
        end_y,
        0,
        end_y,
        0,
        end_x,
        0,
        end_x,
    ];

    let wm_name = "inset".as_bytes();

    set_prop!(&conn, window, "_NET_WM_STRUT", &strut[0..4]);
    set_prop!(&conn, window, "_NET_WM_STRUT_PARTIAL", &strut);
    set_prop!(&conn, window, "_NET_WM_WINDOW_TYPE", @atom "_NET_WM_WINDOW_TYPE_DOCK");
    set_prop!(&conn, window, "_NET_WM_STATE", @atom "_NET_WM_STATE_STICKY");
    set_prop!(&conn, window, "_NET_WM_DESKTOP", &[-1]);
    set_prop!(&conn, window, "_NET_WM_WINDOW_OPACITY", &[0]);
    set_prop!(&conn, window, "_NET_WM_NAME", wm_name, "UTF8_STRING", 8);
    set_prop!(&conn, window, "WM_NAME", wm_name, "STRING", 8);

    xcb::map_window(&conn, window);

    conn.flush();

    loop {
        let event = conn.wait_for_event();
        match event {
            None => break,
            Some(_) => {}
        }
    }

}
