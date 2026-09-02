{
  description = "Willowispll's nixos+finix dendritic flake";

  inputs = {
    #flakeInputs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    #finixInputs
    finix.url = "github:finix-community/finix";
    finix-community-modules.url = "github:finix-community/community-modules";

    #hjemInputs
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #sharedInputs
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree ./modules);
}
