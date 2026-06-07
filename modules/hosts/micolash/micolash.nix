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
      tailscale
      zapret
    ];

    homeModules = with self.homeModules; [
      #userModules
      userVariables

      #programs
      anki
      foliate
      glide
      helix
      kitty
      nixcord
      obs
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
