{ self, inputs, ... }:
let
  inherit (inputs.finix.lib) finixSystem;
in
{
  flake.nixosConfigurations.ebrietas = finixSystem {
    inherit (inputs.nixpkgs) lib;
    modules = with self.nixosModules; [
      ebrietasBoot
      ebrietasConfiguration
      ebrietasFileSystems
      ebrietasFinit
      ebrietasHardware
      ebrietasUser

      nixpkgs
      inputs.finix.nixosModules.nano
      inputs.finix.nixosModules.sudo
      inputs.finix.nixosModules.iwd

      inputs.finix-community-modules.nixosModules.minimal
    ];
  };
}
