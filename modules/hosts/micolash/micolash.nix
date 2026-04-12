{self, ...}: let
  inherit (self.lib) mkSystem;
in {
  flake.nixosConfigurations.micolash = mkSystem {
    configuration = {
      system = "x86_64-linux";
    };

    nixosModules = with self.nixosModules; [
      willowispll
      micolashHardware
      micolashConfiguration
      ly
      gaming
      packages
      niri
      lanzaboote
      amnezia
      v2rayn
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
      lla
      # wm
      waybar
      fuzzel
      mako
    ];
  };
}
