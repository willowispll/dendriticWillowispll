{self, ...}: let
  inherit (self.lib) mkSystem;
in {
  flake.nixosConfigurations.micolash = mkSystem {
    modules = [
      #hostModules
      self.modules.hosts.micolash.boot
      self.modules.hosts.micolash.hardware
      self.modules.hosts.micolash.locale
      self.modules.hosts.micolash.networking
      self.modules.hosts.micolash.nix
      self.modules.hosts.micolash.stateVersion
      self.modules.hosts.micolash.time
      self.modules.hosts.micolash.user

      #featuresModules
      self.modules.nixos.features.homeManager
      self.modules.shared.features.nixLSP
      self.modules.nixos.features.removed
      #specialisation
      self.modules.nixos.features.systemPackages
      self.modules.nixos.features.xdg

      #sharedModules
      self.modules.shared.features.nix
      self.modules.shared.features.nixpkgs
      self.modules.shared.programs.nvf

      #programs
      self.modules.nixos.programs.amnezia
      self.modules.nixos.programs.niri
      self.modules.nixos.programs.steam
      self.modules.nixos.programs.xwayland

      #services
      self.modules.nixos.services.ly
    ];

    homeModules = with self.homeModules; [
      #programs
      anki
      bash
      fastfetch
      fuzzel
      git
      glide
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
