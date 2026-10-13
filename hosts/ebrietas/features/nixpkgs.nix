{ inputs, ... }: {
  flake.hosts.ebrietas.features.nixpkgs = {
    nixpkgs.pkgs = import inputs.nixpkgs {
      system = "x86_64-linux";
      #crossSystem.config = "x86_64-unknown-linux-musl";
      config.allowUnfree = true;
    };
  };
}
