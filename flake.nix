{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    discord-rpc-lsp = {
      url = "github:matthew-hre/discord-rpc-lsp-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:FlameFlag/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    glide = {
      url = "github:glide-browser/glide.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, discord-rpc-lsp, nixcord, spicetify-nix, glide, home-manager } @inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem { 
      specialArgs = {inherit inputs;};
      modules = [
        ./hardware-configuration.nix
        ./configuration.nix
        ./niri.nix
        ./applications.nix
        ./spicetify.nix
        
        ./homeMain.nix
        ./secureBoot/lanzaboote.nix
      ];
    };
  };
}
