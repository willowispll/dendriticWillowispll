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
      willowispll
      micolashHardware
      micolashConfiguration
      ly
      amnezia
      steam
      packages
      niri
      lanzaboote
      homeManager
    ];

    homeModules = with self.homeModules; [
      willowispll
      # apps
      anki
      stylix
      helix
      kitty
      nixcord
      obs
      obsidian
      glide
      foliate
      zed
      spicetify
      # utils
      bash
      fastfetch
      fontconfig
      git
      nh
      xdg
      # wm
      waybar
      fuzzel
      mako
    ];
  };
}
