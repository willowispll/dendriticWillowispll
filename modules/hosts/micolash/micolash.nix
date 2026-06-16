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
      nix
      removed
      systemPackages
      xdg

      #wayland
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
      onlyoffice
      spicetify
      zed

      #utils
      bash
      fastfetch
      fontconfig
      git
      nh
      xdg

      #wayland
      waybar
      fuzzel
      mako

      #stylix
      stylix
    ];
  };
}
