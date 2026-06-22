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

      #featuresModules
      homeManager
      nix
      removed
      specialisation
      systemPackages
      xdg

      #sharedModules
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
      fuzzel
      glide
      helix
      kitty
      nixcord
      obsidian
      onlyoffice
      spicetify
      waybar
      zed

      #services
      mako

      #utils
      bash
      fastfetch
      fontconfig
      git
      nh
      xdg

      #stylix
      stylix
    ];
  };
}
