# Generated by carnix 0.6.6: carnix -o inset.nix --src ./. Cargo.lock --standalone
with import <nixpkgs> {};
let kernel = buildPlatform.parsed.kernel.name;
    abi = buildPlatform.parsed.abi.name;
    include = includedFiles: src: builtins.filterSource (path: type:
      lib.lists.any (f:
        let p = toString (src + ("/" + f)); in
        (path == p) || (type == "directory" && lib.strings.hasPrefix path p)
      ) includedFiles
    ) src;
    updateFeatures = f: up: functions: builtins.deepSeq f (lib.lists.foldl' (features: fun: fun features) (lib.attrsets.recursiveUpdate f up) functions);
    mapFeatures = features: map (fun: fun { features = features; });
    mkFeatures = feat: lib.lists.foldl (features: featureName:
      if feat.${featureName} or false then
        [ featureName ] ++ features
      else
        features
    ) [] (builtins.attrNames feat);
in
rec {
  inset = f: inset_0_1_0 { features = inset_0_1_0_features { inset_0_1_0 = f; }; };
  backtrace_0_3_5_ = { dependencies?[], buildDependencies?[], features?[] }: buildRustCrate {
    crateName = "backtrace";
    version = "0.3.5";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" "The Rust Project Developers" ];
    sha256 = "0vj1dgsivxci5r43w9d56yb98g3r7ff75zr5f592j7yizznshh2r";
    inherit dependencies buildDependencies features;
  };
  backtrace_sys_0_1_16_ = { dependencies?[], buildDependencies?[], features?[] }: buildRustCrate {
    crateName = "backtrace-sys";
    version = "0.1.16";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "1cn2c8q3dn06crmnk0p62czkngam4l8nf57wy33nz1y5g25pszwy";
    build = "build.rs";
    inherit dependencies buildDependencies features;
  };
  cc_1_0_8_ = { dependencies?[], buildDependencies?[], features?[] }: buildRustCrate {
    crateName = "cc";
    version = "1.0.8";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0lfzqwcd6zppx0p5gn23wl24v2yrha01pibhxfzazc1a8q0d8qwn";
    inherit dependencies buildDependencies features;
  };
  cfg_if_0_1_2_ = { dependencies?[], buildDependencies?[], features?[] }: buildRustCrate {
    crateName = "cfg-if";
    version = "0.1.2";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0x06hvrrqy96m97593823vvxcgvjaxckghwyy2jcyc8qc7c6cyhi";
    inherit dependencies buildDependencies features;
  };
  either_1_4_0_ = { dependencies?[], buildDependencies?[], features?[] }: buildRustCrate {
    crateName = "either";
    version = "1.4.0";
    authors = [ "bluss" ];
    sha256 = "04kpfd84lvyrkb2z4sljlz2d3d5qczd0sb1yy37fgijq2yx3vb37";
    inherit dependencies buildDependencies features;
  };
  error_chain_0_11_0_ = { dependencies?[], buildDependencies?[], features?[] }: buildRustCrate {
    crateName = "error-chain";
    version = "0.11.0";
    authors = [ "Brian Anderson <banderson@mozilla.com>" "Paul Colomiets <paul@colomiets.name>" "Colin Kiegel <kiegel@gmx.de>" "Yamakaky <yamakaky@yamaworld.fr>" ];
    sha256 = "19nz17q6dzp0mx2jhh9qbj45gkvvgcl7zq9z2ai5a8ihbisfj6d7";
    inherit dependencies buildDependencies features;
  };
  inset_0_1_0_ = { dependencies?[], buildDependencies?[], features?[] }: buildRustCrate {
    crateName = "inset";
    version = "0.1.0";
    authors = [ "Tad Fisher <tadfisher@gmail.com>" ];
    src = ./.;
    inherit dependencies buildDependencies features;
  };
  itertools_0_7_7_ = { dependencies?[], buildDependencies?[], features?[] }: buildRustCrate {
    crateName = "itertools";
    version = "0.7.7";
    authors = [ "bluss" ];
    sha256 = "05j5jp7fs3ngpnkn2paly0ybz0jngcklfrdgvwh9yjak80abvwfl";
    inherit dependencies buildDependencies features;
  };
  libc_0_2_39_ = { dependencies?[], buildDependencies?[], features?[] }: buildRustCrate {
    crateName = "libc";
    version = "0.2.39";
    authors = [ "The Rust Project Developers" ];
    sha256 = "0sv0abs2msd0f9x0gf00v6ha7g8hfl3kbbd8d61kn3zwnpsgb8fw";
    inherit dependencies buildDependencies features;
  };
  log_0_4_1_ = { dependencies?[], buildDependencies?[], features?[] }: buildRustCrate {
    crateName = "log";
    version = "0.4.1";
    authors = [ "The Rust Project Developers" ];
    sha256 = "01vm8yy3wngvyj6qp1x3xpcb4xq7v67yn9l7fsma8kz28mliz90d";
    inherit dependencies buildDependencies features;
  };
  rustc_demangle_0_1_7_ = { dependencies?[], buildDependencies?[], features?[] }: buildRustCrate {
    crateName = "rustc-demangle";
    version = "0.1.7";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "0wrln6jvwmqrhyvqlw5vq9a2s4r04ja8mrybxjj9aaaar1fyvns6";
    inherit dependencies buildDependencies features;
  };
  winapi_0_3_4_ = { dependencies?[], buildDependencies?[], features?[] }: buildRustCrate {
    crateName = "winapi";
    version = "0.3.4";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "1qbrf5dcnd8j36cawby5d9r5vx07r0l4ryf672pfncnp8895k9lx";
    build = "build.rs";
    inherit dependencies buildDependencies features;
  };
  winapi_i686_pc_windows_gnu_0_4_0_ = { dependencies?[], buildDependencies?[], features?[] }: buildRustCrate {
    crateName = "winapi-i686-pc-windows-gnu";
    version = "0.4.0";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "05ihkij18r4gamjpxj4gra24514can762imjzlmak5wlzidplzrp";
    build = "build.rs";
    inherit dependencies buildDependencies features;
  };
  winapi_x86_64_pc_windows_gnu_0_4_0_ = { dependencies?[], buildDependencies?[], features?[] }: buildRustCrate {
    crateName = "winapi-x86_64-pc-windows-gnu";
    version = "0.4.0";
    authors = [ "Peter Atashian <retep998@gmail.com>" ];
    sha256 = "0n1ylmlsb8yg1v583i4xy0qmqg42275flvbc51hdqjjfjcl9vlbj";
    build = "build.rs";
    inherit dependencies buildDependencies features;
  };
  xcb_0_8_2_ = { dependencies?[], buildDependencies?[], features?[] }: buildRustCrate {
    crateName = "xcb";
    version = "0.8.2";
    authors = [ "Remi Thebault <remi.thebault@gmail.com>" ];
    sha256 = "06l8jms57wvz01vx82a3cwak9b9qwdkadvpmkk1zimy2qg7i7dkl";
    build = "build.rs";
    inherit dependencies buildDependencies features;
  };
  backtrace_0_3_5 = { features?(backtrace_0_3_5_features {}) }: backtrace_0_3_5_ {
    dependencies = mapFeatures features ([ cfg_if_0_1_2 rustc_demangle_0_1_7 ])
      ++ (if (kernel == "linux" || kernel == "darwin") && !(kernel == "fuchsia") && !(kernel == "emscripten") && !(kernel == "darwin") && !(kernel == "ios") then mapFeatures features ([ ]
      ++ (if features.backtrace_0_3_5.backtrace-sys or false then [ backtrace_sys_0_1_16 ] else [])) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([ libc_0_2_39 ]) else [])
      ++ (if kernel == "windows" then mapFeatures features ([ ]
      ++ (if features.backtrace_0_3_5.winapi or false then [ winapi_0_3_4 ] else [])) else []);
    features = mkFeatures (features.backtrace_0_3_5 or {});
  };
  backtrace_0_3_5_features = f: updateFeatures f (rec {
    backtrace_0_3_5.addr2line =
      (f.backtrace_0_3_5.addr2line or false) ||
      (f.backtrace_0_3_5.gimli-symbolize or false) ||
      (backtrace_0_3_5.gimli-symbolize or false);
    backtrace_0_3_5.backtrace-sys =
      (f.backtrace_0_3_5.backtrace-sys or false) ||
      (f.backtrace_0_3_5.libbacktrace or false) ||
      (backtrace_0_3_5.libbacktrace or false);
    backtrace_0_3_5.coresymbolication =
      (f.backtrace_0_3_5.coresymbolication or false) ||
      (f.backtrace_0_3_5.default or false) ||
      (backtrace_0_3_5.default or false);
    backtrace_0_3_5.dbghelp =
      (f.backtrace_0_3_5.dbghelp or false) ||
      (f.backtrace_0_3_5.default or false) ||
      (backtrace_0_3_5.default or false);
    backtrace_0_3_5.default = (f.backtrace_0_3_5.default or true);
    backtrace_0_3_5.dladdr =
      (f.backtrace_0_3_5.dladdr or false) ||
      (f.backtrace_0_3_5.default or false) ||
      (backtrace_0_3_5.default or false);
    backtrace_0_3_5.findshlibs =
      (f.backtrace_0_3_5.findshlibs or false) ||
      (f.backtrace_0_3_5.gimli-symbolize or false) ||
      (backtrace_0_3_5.gimli-symbolize or false);
    backtrace_0_3_5.libbacktrace =
      (f.backtrace_0_3_5.libbacktrace or false) ||
      (f.backtrace_0_3_5.default or false) ||
      (backtrace_0_3_5.default or false);
    backtrace_0_3_5.libunwind =
      (f.backtrace_0_3_5.libunwind or false) ||
      (f.backtrace_0_3_5.default or false) ||
      (backtrace_0_3_5.default or false);
    backtrace_0_3_5.rustc-serialize =
      (f.backtrace_0_3_5.rustc-serialize or false) ||
      (f.backtrace_0_3_5.serialize-rustc or false) ||
      (backtrace_0_3_5.serialize-rustc or false);
    backtrace_0_3_5.serde =
      (f.backtrace_0_3_5.serde or false) ||
      (f.backtrace_0_3_5.serialize-serde or false) ||
      (backtrace_0_3_5.serialize-serde or false);
    backtrace_0_3_5.serde_derive =
      (f.backtrace_0_3_5.serde_derive or false) ||
      (f.backtrace_0_3_5.serialize-serde or false) ||
      (backtrace_0_3_5.serialize-serde or false);
    backtrace_0_3_5.winapi =
      (f.backtrace_0_3_5.winapi or false) ||
      (f.backtrace_0_3_5.dbghelp or false) ||
      (backtrace_0_3_5.dbghelp or false);
    backtrace_sys_0_1_16.default = true;
    cfg_if_0_1_2.default = true;
    libc_0_2_39.default = true;
    rustc_demangle_0_1_7.default = true;
    winapi_0_3_4.dbghelp = true;
    winapi_0_3_4.default = true;
    winapi_0_3_4.minwindef = true;
    winapi_0_3_4.processthreadsapi = true;
    winapi_0_3_4.std = true;
    winapi_0_3_4.winnt = true;
  }) [ cfg_if_0_1_2_features rustc_demangle_0_1_7_features backtrace_sys_0_1_16_features libc_0_2_39_features winapi_0_3_4_features ];
  backtrace_sys_0_1_16 = { features?(backtrace_sys_0_1_16_features {}) }: backtrace_sys_0_1_16_ {
    dependencies = mapFeatures features ([ libc_0_2_39 ]);
    buildDependencies = mapFeatures features ([ cc_1_0_8 ]);
  };
  backtrace_sys_0_1_16_features = f: updateFeatures f (rec {
    backtrace_sys_0_1_16.default = (f.backtrace_sys_0_1_16.default or true);
    cc_1_0_8.default = true;
    libc_0_2_39.default = true;
  }) [ libc_0_2_39_features cc_1_0_8_features ];
  cc_1_0_8 = { features?(cc_1_0_8_features {}) }: cc_1_0_8_ {
    dependencies = mapFeatures features ([]);
    features = mkFeatures (features.cc_1_0_8 or {});
  };
  cc_1_0_8_features = f: updateFeatures f (rec {
    cc_1_0_8.default = (f.cc_1_0_8.default or true);
    cc_1_0_8.rayon =
      (f.cc_1_0_8.rayon or false) ||
      (f.cc_1_0_8.parallel or false) ||
      (cc_1_0_8.parallel or false);
  }) [];
  cfg_if_0_1_2 = { features?(cfg_if_0_1_2_features {}) }: cfg_if_0_1_2_ {};
  cfg_if_0_1_2_features = f: updateFeatures f (rec {
    cfg_if_0_1_2.default = (f.cfg_if_0_1_2.default or true);
  }) [];
  either_1_4_0 = { features?(either_1_4_0_features {}) }: either_1_4_0_ {
    dependencies = mapFeatures features ([]);
    features = mkFeatures (features.either_1_4_0 or {});
  };
  either_1_4_0_features = f: updateFeatures f (rec {
    either_1_4_0.default = (f.either_1_4_0.default or true);
    either_1_4_0.use_std =
      (f.either_1_4_0.use_std or false) ||
      (f.either_1_4_0.default or false) ||
      (either_1_4_0.default or false);
  }) [];
  error_chain_0_11_0 = { features?(error_chain_0_11_0_features {}) }: error_chain_0_11_0_ {
    dependencies = mapFeatures features ([ ]
      ++ (if features.error_chain_0_11_0.backtrace or false then [ backtrace_0_3_5 ] else []));
    features = mkFeatures (features.error_chain_0_11_0 or {});
  };
  error_chain_0_11_0_features = f: updateFeatures f (rec {
    backtrace_0_3_5.default = true;
    error_chain_0_11_0.backtrace =
      (f.error_chain_0_11_0.backtrace or false) ||
      (f.error_chain_0_11_0.default or false) ||
      (error_chain_0_11_0.default or false);
    error_chain_0_11_0.default = (f.error_chain_0_11_0.default or true);
    error_chain_0_11_0.example_generated =
      (f.error_chain_0_11_0.example_generated or false) ||
      (f.error_chain_0_11_0.default or false) ||
      (error_chain_0_11_0.default or false);
  }) [ backtrace_0_3_5_features ];
  inset_0_1_0 = { features?(inset_0_1_0_features {}) }: inset_0_1_0_ {
    dependencies = mapFeatures features ([ error_chain_0_11_0 itertools_0_7_7 xcb_0_8_2 ]);
  };
  inset_0_1_0_features = f: updateFeatures f (rec {
    error_chain_0_11_0.default = true;
    inset_0_1_0.default = (f.inset_0_1_0.default or true);
    itertools_0_7_7.default = true;
    xcb_0_8_2.default = true;
    xcb_0_8_2.randr = true;
  }) [ error_chain_0_11_0_features itertools_0_7_7_features xcb_0_8_2_features ];
  itertools_0_7_7 = { features?(itertools_0_7_7_features {}) }: itertools_0_7_7_ {
    dependencies = mapFeatures features ([ either_1_4_0 ]);
    features = mkFeatures (features.itertools_0_7_7 or {});
  };
  itertools_0_7_7_features = f: updateFeatures f (rec {
    either_1_4_0.default = (f.either_1_4_0.default or false);
    itertools_0_7_7.default = (f.itertools_0_7_7.default or true);
    itertools_0_7_7.use_std =
      (f.itertools_0_7_7.use_std or false) ||
      (f.itertools_0_7_7.default or false) ||
      (itertools_0_7_7.default or false);
  }) [ either_1_4_0_features ];
  libc_0_2_39 = { features?(libc_0_2_39_features {}) }: libc_0_2_39_ {
    features = mkFeatures (features.libc_0_2_39 or {});
  };
  libc_0_2_39_features = f: updateFeatures f (rec {
    libc_0_2_39.default = (f.libc_0_2_39.default or true);
    libc_0_2_39.use_std =
      (f.libc_0_2_39.use_std or false) ||
      (f.libc_0_2_39.default or false) ||
      (libc_0_2_39.default or false);
  }) [];
  log_0_4_1 = { features?(log_0_4_1_features {}) }: log_0_4_1_ {
    dependencies = mapFeatures features ([ cfg_if_0_1_2 ]);
    features = mkFeatures (features.log_0_4_1 or {});
  };
  log_0_4_1_features = f: updateFeatures f (rec {
    cfg_if_0_1_2.default = true;
    log_0_4_1.default = (f.log_0_4_1.default or true);
  }) [ cfg_if_0_1_2_features ];
  rustc_demangle_0_1_7 = { features?(rustc_demangle_0_1_7_features {}) }: rustc_demangle_0_1_7_ {};
  rustc_demangle_0_1_7_features = f: updateFeatures f (rec {
    rustc_demangle_0_1_7.default = (f.rustc_demangle_0_1_7.default or true);
  }) [];
  winapi_0_3_4 = { features?(winapi_0_3_4_features {}) }: winapi_0_3_4_ {
    dependencies = (if kernel == "i686-pc-windows-gnu" then mapFeatures features ([ winapi_i686_pc_windows_gnu_0_4_0 ]) else [])
      ++ (if kernel == "x86_64-pc-windows-gnu" then mapFeatures features ([ winapi_x86_64_pc_windows_gnu_0_4_0 ]) else []);
    features = mkFeatures (features.winapi_0_3_4 or {});
  };
  winapi_0_3_4_features = f: updateFeatures f (rec {
    winapi_0_3_4.default = (f.winapi_0_3_4.default or true);
    winapi_i686_pc_windows_gnu_0_4_0.default = true;
    winapi_x86_64_pc_windows_gnu_0_4_0.default = true;
  }) [ winapi_i686_pc_windows_gnu_0_4_0_features winapi_x86_64_pc_windows_gnu_0_4_0_features ];
  winapi_i686_pc_windows_gnu_0_4_0 = { features?(winapi_i686_pc_windows_gnu_0_4_0_features {}) }: winapi_i686_pc_windows_gnu_0_4_0_ {};
  winapi_i686_pc_windows_gnu_0_4_0_features = f: updateFeatures f (rec {
    winapi_i686_pc_windows_gnu_0_4_0.default = (f.winapi_i686_pc_windows_gnu_0_4_0.default or true);
  }) [];
  winapi_x86_64_pc_windows_gnu_0_4_0 = { features?(winapi_x86_64_pc_windows_gnu_0_4_0_features {}) }: winapi_x86_64_pc_windows_gnu_0_4_0_ {};
  winapi_x86_64_pc_windows_gnu_0_4_0_features = f: updateFeatures f (rec {
    winapi_x86_64_pc_windows_gnu_0_4_0.default = (f.winapi_x86_64_pc_windows_gnu_0_4_0.default or true);
  }) [];
  xcb_0_8_2 = { features?(xcb_0_8_2_features {}) }: xcb_0_8_2_ {
    dependencies = mapFeatures features ([ libc_0_2_39 log_0_4_1 ]);
    buildDependencies = mapFeatures features ([ libc_0_2_39 ]);
    features = mkFeatures (features.xcb_0_8_2 or {});
  };
  xcb_0_8_2_features = f: updateFeatures f (rec {
    libc_0_2_39.default = true;
    log_0_4_1.default = true;
    xcb_0_8_2.composite =
      (f.xcb_0_8_2.composite or false) ||
      (f.xcb_0_8_2.debug_all or false) ||
      (xcb_0_8_2.debug_all or false);
    xcb_0_8_2.damage =
      (f.xcb_0_8_2.damage or false) ||
      (f.xcb_0_8_2.debug_all or false) ||
      (xcb_0_8_2.debug_all or false);
    xcb_0_8_2.default = (f.xcb_0_8_2.default or true);
    xcb_0_8_2.dpms =
      (f.xcb_0_8_2.dpms or false) ||
      (f.xcb_0_8_2.debug_all or false) ||
      (xcb_0_8_2.debug_all or false);
    xcb_0_8_2.dri2 =
      (f.xcb_0_8_2.dri2 or false) ||
      (f.xcb_0_8_2.debug_all or false) ||
      (xcb_0_8_2.debug_all or false);
    xcb_0_8_2.dri3 =
      (f.xcb_0_8_2.dri3 or false) ||
      (f.xcb_0_8_2.debug_all or false) ||
      (xcb_0_8_2.debug_all or false);
    xcb_0_8_2.glx =
      (f.xcb_0_8_2.glx or false) ||
      (f.xcb_0_8_2.debug_all or false) ||
      (xcb_0_8_2.debug_all or false);
    xcb_0_8_2.randr =
      (f.xcb_0_8_2.randr or false) ||
      (f.xcb_0_8_2.debug_all or false) ||
      (xcb_0_8_2.debug_all or false);
    xcb_0_8_2.record =
      (f.xcb_0_8_2.record or false) ||
      (f.xcb_0_8_2.debug_all or false) ||
      (xcb_0_8_2.debug_all or false);
    xcb_0_8_2.render =
      (f.xcb_0_8_2.render or false) ||
      (f.xcb_0_8_2.debug_all or false) ||
      (xcb_0_8_2.debug_all or false) ||
      (f.xcb_0_8_2.present or false) ||
      (xcb_0_8_2.present or false) ||
      (f.xcb_0_8_2.randr or false) ||
      (xcb_0_8_2.randr or false) ||
      (f.xcb_0_8_2.xfixes or false) ||
      (xcb_0_8_2.xfixes or false);
    xcb_0_8_2.res =
      (f.xcb_0_8_2.res or false) ||
      (f.xcb_0_8_2.debug_all or false) ||
      (xcb_0_8_2.debug_all or false);
    xcb_0_8_2.screensaver =
      (f.xcb_0_8_2.screensaver or false) ||
      (f.xcb_0_8_2.debug_all or false) ||
      (xcb_0_8_2.debug_all or false);
    xcb_0_8_2.shape =
      (f.xcb_0_8_2.shape or false) ||
      (f.xcb_0_8_2.debug_all or false) ||
      (xcb_0_8_2.debug_all or false) ||
      (f.xcb_0_8_2.xfixes or false) ||
      (xcb_0_8_2.xfixes or false);
    xcb_0_8_2.shm =
      (f.xcb_0_8_2.shm or false) ||
      (f.xcb_0_8_2.debug_all or false) ||
      (xcb_0_8_2.debug_all or false) ||
      (f.xcb_0_8_2.xv or false) ||
      (xcb_0_8_2.xv or false);
    xcb_0_8_2.sync =
      (f.xcb_0_8_2.sync or false) ||
      (f.xcb_0_8_2.present or false) ||
      (xcb_0_8_2.present or false);
    xcb_0_8_2.thread =
      (f.xcb_0_8_2.thread or false) ||
      (f.xcb_0_8_2.debug_all or false) ||
      (xcb_0_8_2.debug_all or false);
    xcb_0_8_2.xevie =
      (f.xcb_0_8_2.xevie or false) ||
      (f.xcb_0_8_2.debug_all or false) ||
      (xcb_0_8_2.debug_all or false);
    xcb_0_8_2.xf86dri =
      (f.xcb_0_8_2.xf86dri or false) ||
      (f.xcb_0_8_2.debug_all or false) ||
      (xcb_0_8_2.debug_all or false);
    xcb_0_8_2.xfixes =
      (f.xcb_0_8_2.xfixes or false) ||
      (f.xcb_0_8_2.composite or false) ||
      (xcb_0_8_2.composite or false) ||
      (f.xcb_0_8_2.damage or false) ||
      (xcb_0_8_2.damage or false) ||
      (f.xcb_0_8_2.debug_all or false) ||
      (xcb_0_8_2.debug_all or false) ||
      (f.xcb_0_8_2.present or false) ||
      (xcb_0_8_2.present or false) ||
      (f.xcb_0_8_2.xinput or false) ||
      (xcb_0_8_2.xinput or false);
    xcb_0_8_2.xinerama =
      (f.xcb_0_8_2.xinerama or false) ||
      (f.xcb_0_8_2.debug_all or false) ||
      (xcb_0_8_2.debug_all or false);
    xcb_0_8_2.xkb =
      (f.xcb_0_8_2.xkb or false) ||
      (f.xcb_0_8_2.debug_all or false) ||
      (xcb_0_8_2.debug_all or false);
    xcb_0_8_2.xlib_xcb =
      (f.xcb_0_8_2.xlib_xcb or false) ||
      (f.xcb_0_8_2.debug_all or false) ||
      (xcb_0_8_2.debug_all or false);
    xcb_0_8_2.xprint =
      (f.xcb_0_8_2.xprint or false) ||
      (f.xcb_0_8_2.debug_all or false) ||
      (xcb_0_8_2.debug_all or false);
    xcb_0_8_2.xselinux =
      (f.xcb_0_8_2.xselinux or false) ||
      (f.xcb_0_8_2.debug_all or false) ||
      (xcb_0_8_2.debug_all or false);
    xcb_0_8_2.xtest =
      (f.xcb_0_8_2.xtest or false) ||
      (f.xcb_0_8_2.debug_all or false) ||
      (xcb_0_8_2.debug_all or false);
    xcb_0_8_2.xv =
      (f.xcb_0_8_2.xv or false) ||
      (f.xcb_0_8_2.debug_all or false) ||
      (xcb_0_8_2.debug_all or false) ||
      (f.xcb_0_8_2.xvmc or false) ||
      (xcb_0_8_2.xvmc or false);
    xcb_0_8_2.xvmc =
      (f.xcb_0_8_2.xvmc or false) ||
      (f.xcb_0_8_2.debug_all or false) ||
      (xcb_0_8_2.debug_all or false);
  }) [ libc_0_2_39_features log_0_4_1_features libc_0_2_39_features ];
}
