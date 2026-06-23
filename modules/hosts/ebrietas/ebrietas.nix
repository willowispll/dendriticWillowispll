{ self, ... }:
let
  inherit (self.lib) mkSystem;
in
{
  flake.nixosConfigurations.ebrietas = mkSystem {
    finix = true;

    modules = with self.nixosModules; [
      #hostModules
      ebrietasBoot
      ebrietasFileSystems
      ebrietasFinit
      ebrietasHardware
      ebrietasNetworking
      ebrietasTime
      ebrietasUser

      #sharedModules
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
