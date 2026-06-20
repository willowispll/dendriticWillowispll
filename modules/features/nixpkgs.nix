{ inputs, ... }: {
  flake.nixosModules.nixpkgs = { config, ... }: {
    nixpkgs.pkgs = import inputs.nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
  };
}
