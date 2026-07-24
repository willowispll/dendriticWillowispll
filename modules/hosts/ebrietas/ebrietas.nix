{self, ...}: let
  inherit (self.lib) mkSystem;
in {
  flake.nixosConfigurations.ebrietas = mkSystem {
    finix = true;

    modules = [
      #hostModules
      self.modules.hosts.ebrietas.boot
      self.modules.hosts.ebrietas.fileSystems
      self.modules.hosts.ebrietas.finit
      self.modules.hosts.ebrietas.hardware
      self.modules.hosts.ebrietas.networking
      self.modules.hosts.ebrietas.time
      self.modules.hosts.ebrietas.user

      #sharedFeatures
      self.modules.shared.features.nix
      self.modules.shared.features.nixpkgs

      #sharedPrograms
      self.modules.shared.programs.nvf

      #finixEnvironment
      #self.modules.finix.environment.default

      #finixFeatures
      self.modules.finix.features.fonts
      self.modules.finix.features.hjem
      self.modules.finix.features.packages
      self.modules.finix.features.xdg

      #finixProfiles
      self.modules.finix.profiles.minimal

      #finixPrograms
      self.modules.finix.programs.coreutils
      self.modules.finix.programs.limine
      self.modules.finix.programs.pipewire
      self.modules.finix.programs.sudo
      self.modules.finix.programs.v2rayn
      self.modules.finix.programs.xorg

      #finixServices
      self.modules.finix.services.chronyd
      self.modules.finix.services.dbus
      self.modules.finix.services.ly
      self.modules.finix.services.polkit
      self.modules.finix.services.seatd
    ];

    hjemModules = [
      self.hjemModules.fastfetch
      self.hjemModules.kitty
      self.hjemModules.picom
      self.hjemModules.rofi
    ];
  };
}
