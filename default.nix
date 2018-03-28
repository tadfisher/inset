with import <nixpkgs> {};

rec {
  release = ((import ./inset.nix).inset {}).override {
    crateOverrides = defaultCrateOverrides // {
      inset = attrs: {
        buildInputs = [
          python3
          xorg.libxcb
        ];
      };
    };
  };

  debug = release.override {
    release = false;
  };
}
