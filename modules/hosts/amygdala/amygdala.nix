{ self, ... }:
let
  inherit (self.lib) mkSystem;
in
{
  flake.nixosConfigurations.amygdala = mkSystem {
    configuration = {
      system = "x86_64-linux";
    };
    nixosModules = with self.nixosModules; [
      willowispll
      amygdalaHardware
      amygdalaConfiguration
      ly
      packages
      niri
      amnezia
      tlp
      homeManager
    ];
    homeModules = with self.homeModules; [
      willowispll
      # apps
      anki
      stylix
      helix
      kitty
      obsidian
      glide
      foliate
      zed
      spicetify
      nixcord
      obs
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
