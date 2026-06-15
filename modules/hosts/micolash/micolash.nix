{ self, ... }:
let
  inherit (self.lib) mkSystem;
in
{
  flake.nixosConfigurations.micolash = mkSystem {
    configuration = {
      system = "x86_64-linux";
    };

    nixosModules = with self.nixosModules; [
      #userModules
      userVariables

      #hostModules
      micolashConfiguration
      micolashHardware
      lanzaboote

      #featuresModules
      homeManager
      removed
      systemPackages

      #niri
      niri

      #programs
      amnezia
      steam

      #services
      ly
    ];

    homeModules = with self.homeModules; [
      #userModules
      userVariables

      #programs
      anki
      glide
      helix
      kitty
      nixcord
      obsidian
      spicetify
      zed

      #utils
      bash
      fastfetch
      fontconfig
      git
      nh
      xdg

      #niri
      waybar
      fuzzel
      mako

      #stylix
      stylix
    ];
  };
}
