{ self, inputs, ... }:
let
  inherit (inputs.finix.lib) finixSystem;
in
{
  flake.nixosConfigurations.ebrietas = finixSystem {
    inherit (inputs.nixpkgs) lib;
    modules = with self.nixosModules; [
      #hostModules
      ebrietasBoot
      ebrietasFileSystems
      ebrietasFinit
      ebrietasHardware
      ebrietasNetworking
      ebrietasTime
      ebrietasUser

      #featuresModules
      nixpkgs

      #finixModules
      finixPackages

      #finixProfiles
      finixProfilesMinimal

      #finixPrograms
      finixProgramsSudo

      #finixServices
      finixServicesDbus
      finixServicesSeatd
    ];
  };
}
