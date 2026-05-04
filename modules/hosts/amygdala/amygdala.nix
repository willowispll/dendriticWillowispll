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
      homeManager
    ];
    homeModules = with self.homeModules; [
      willowispll
      # apps
      stylix
      helix
      kitty
      glide
      zed
      spicetify
      nixcord
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
