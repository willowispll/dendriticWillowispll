{ self, ... }: {
  flake.hosts.micolash.features.nixpkgs = {
    nixpkgs.pkgs = import self.inputs.nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
      overlays = [
        self.overlays.without-bloat
        self.overlays.without-systemd
        self.overlays.without-x11
      ];
    };
  };
}
