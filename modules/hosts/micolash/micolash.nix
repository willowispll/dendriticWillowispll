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
      nixpkgs
      removed
      specialisation
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
