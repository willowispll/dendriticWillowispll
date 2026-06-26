{ self, ... }:
let
  inherit (self.lib) mkSystem;
in
{
  flake.nixosConfigurations.micolash = mkSystem {
    modules = with self.nixosModules; [
      #userModules
      userVariables

      #hostModules
      micolashBoot
      micolashHardware
      micolashLocale
      micolashNetworking
      micolashNix
      micolashStateVersion
      micolashTime

      #nixosFeatures
      homeManager
      removed
      specialisation
      systemPackages
      xdg

      #sharedModules
      nix
      nixpkgs

      #nixosPrograms
      nixosProgramsAmnezia
      nixosProgramsNiri
      nixosProgramsSteam
      nixosProgramsXwayland

      #nixosServices
      nixosServicesLy
    ];

    homeModules = with self.homeModules; [
      #userModules
      userVariables

      #programs
      anki
      bash
      fastfetch
      fuzzel
      git
      glide
      helix
      kitty
      nh
      nixcord
      obsidian
      onlyoffice
      spicetify
      waybar

      #services
      mako

      #utils
      fontconfig
      xdg

      #stylix
      stylix
    ];
  };
}
