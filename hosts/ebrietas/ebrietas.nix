{self, ...}: let
  inherit (self.lib) mkSystem;
in {
  flake.nixosConfigurations.ebrietas = mkSystem {
    finix = true;

    modules = [
      #ebrietasFeatures
      self.hosts.ebrietas.features.environment
      self.hosts.ebrietas.features.finit
      self.hosts.ebrietas.features.fonts
      self.hosts.ebrietas.features.hjem
      self.hosts.ebrietas.features.nixpkgs
      self.hosts.ebrietas.features.xdg

      #ebrietasPrograms
      self.hosts.ebrietas.programs.bash
      self.hosts.ebrietas.programs.coreutils
      self.hosts.ebrietas.programs.gnome-keyring
      self.hosts.ebrietas.programs.limine
      self.hosts.ebrietas.programs.pipewire
      self.hosts.ebrietas.programs.sh
      self.hosts.ebrietas.programs.sudo
      self.hosts.ebrietas.programs.v2rayn
      self.hosts.ebrietas.programs.vxwm
      self.hosts.ebrietas.programs.xorg

      #ebrietasServices
      self.hosts.ebrietas.services.chronyd
      self.hosts.ebrietas.services.dbus
      self.hosts.ebrietas.services.dhcpcd
      self.hosts.ebrietas.services.getty
      self.hosts.ebrietas.services.keventd
      self.hosts.ebrietas.services.ly
      self.hosts.ebrietas.services.nix-daemon
      self.hosts.ebrietas.services.polkit
      self.hosts.ebrietas.services.seatd
      self.hosts.ebrietas.services.sysklogd

      #ebrietasSystem
      self.hosts.ebrietas.system.boot
      self.hosts.ebrietas.system.fileSystems
      self.hosts.ebrietas.system.hardware
      self.hosts.ebrietas.system.networking
      self.hosts.ebrietas.system.time
      self.hosts.ebrietas.system.user
    ];

    hjemModules = [
      #hjemModules
      self.hjemModules.fastfetch
      self.hjemModules.picom
    ];
  };
}
