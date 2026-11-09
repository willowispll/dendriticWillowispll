{
  description = "Willowispll's nixos+finix dendritic flake";

  inputs = {
    #nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    #finix
    finix.url = "github:finix-community/finix";
    finix-community-modules.url = "github:finix-community/community-modules";

    #hjem and basix
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    basix = {
      url = "github:NotAShelf/basix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #flake
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ (inputs.import-tree ./hosts) ];
      flake.overlays.without-bloat = import ./overlays/without-bloat.nix;
      flake.overlays.without-systemd = import ./overlays/without-systemd.nix;
      flake.overlays.without-x11 = import ./overlays/without-x11.nix;
    };
}
