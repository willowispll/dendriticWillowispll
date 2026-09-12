{
  description = "Willowispll's nixos+finix dendritic flake";

  inputs = {
    #flake
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    #nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    #finix
    finix.url = "github:finix-community/finix";
    finix-community-modules.url = "github:finix-community/community-modules";

    #hjem
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree ./hosts);
}
