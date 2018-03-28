use std::fmt;

error_chain! {
    foreign_links {
        XcbConnectionError(::xcb::ConnError);
    }

    errors {
        XcbNoScreenError(err: ()) {
            description("No screen found"),
            display("No screen found"),
        }
    }
}

#[derive(Clone, Copy, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
pub enum XErrorKind {
    NoPrimaryOutput,
    OutputNotFound,
}

impl XErrorKind {
    fn as_str(&self) -> &'static str {
        match *self {
            XErrorKind::NoPrimaryOutput => "Unable to find primary output",
            XErrorKind::OutputNotFound => "Unable to find specified output",
        }
    }
}

#[derive(Debug, Clone, Copy, Hash, Eq, PartialEq)]
pub struct XError {
    pub kind: XErrorKind,
}

impl From<XErrorKind> for XError {
    fn from(kind: XErrorKind) -> XError {
        XError { kind }
    }
}

impl fmt::Display for XError {
    fn fmt(&self, fmt: &mut fmt::Formatter) -> fmt::Result {
        write!(fmt, "{}", self.kind.as_str())
    }
}

impl ::std::error::Error for XError {
    fn description(&self) -> &str {
        self.kind.as_str()
    }
}
