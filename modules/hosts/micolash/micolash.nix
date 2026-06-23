{ self, ... }:
let
  inherit (self.lib) mkSystem;
in
{
  flake.nixosConfigurations.micolash = mkSystem {
    nixosModules = with self.nixosModules; [
      #userModules
      userVariables

      #hostModules
      micolashBoot
      micolashConfiguration
      micolashHardware

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
      zed

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
