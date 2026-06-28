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

      #finixFeatures
      finixFeaturesFonts
      finixFeaturesHjem
      #finixProfiles
      finixProfilesMinimal

      #finixPrograms
      finixProgramsFastfetch
      finixProgramsPipewire
      finixProgramsV2rayn
      finixProgramsSudo
      finixProgramsXorg

      #finixServices
      finixServicesDbus
      finixServicesLy
      finixServicesPolkit
      finixServicesSeatd
    ];
  };
}
