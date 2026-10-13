{ inputs, ... }: {
  flake.hosts.micolash.features.nixpkgs = {
    nixpkgs.pkgs = import inputs.nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
  };
}
