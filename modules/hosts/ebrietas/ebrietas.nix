{self, ...}: let
  inherit (self.lib) mkSystem;
in {
  flake.nixosConfigurations.ebrietas = mkSystem {
    finix = true;

    modules = [
      #hostModules
      self.modules.hosts.ebrietas.boot
      self.modules.hosts.ebrietas.fileSystems
      self.modules.hosts.ebrietas.hardware
      self.modules.hosts.ebrietas.networking
      self.modules.hosts.ebrietas.time
      self.modules.hosts.ebrietas.user

      #finixFeatures
      self.modules.finix.features.environment
      self.modules.finix.features.finit
      self.modules.finix.features.fonts
      self.modules.finix.features.hjem
      self.modules.finix.features.nixpkgs
      self.modules.finix.features.xdg

      #finixPrograms
      self.modules.finix.programs.bash
      self.modules.finix.programs.coreutils
      self.modules.finix.programs.gnome-keyring
      self.modules.finix.programs.limine
      self.modules.finix.programs.nvf
      self.modules.finix.programs.pipewire
      self.modules.finix.programs.sudo
      self.modules.finix.programs.v2rayn
      self.modules.finix.programs.vxwm
      self.modules.finix.programs.xorg

      #finixServices
      self.modules.finix.services.chronyd
      self.modules.finix.services.dbus
      self.modules.finix.services.dhcpcd
      self.modules.finix.services.getty
      self.modules.finix.services.keventd
      self.modules.finix.services.ly
      self.modules.finix.services.nix-daemon
      self.modules.finix.services.polkit
      self.modules.finix.services.seatd
      self.modules.finix.services.sysklogd
    ];

    hjemModules = [
      self.hjemModules.fastfetch
      self.hjemModules.picom
    ];
  };
}
