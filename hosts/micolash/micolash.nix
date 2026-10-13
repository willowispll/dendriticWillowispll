{ self, ... }:
let
  inherit (self.lib) mkSystem;
in
{
  flake.nixosConfigurations.micolash = mkSystem {
    finix = true;

    modules = [
      #micolashFeatures
      self.hosts.micolash.features.environment
      self.hosts.micolash.features.finit
      self.hosts.micolash.features.fonts
      self.hosts.micolash.features.hjem
      self.hosts.micolash.features.nixpkgs
      self.hosts.micolash.features.xdg

      #micolashPrograms
      self.hosts.micolash.programs.bash
      self.hosts.micolash.programs.coreutils
      self.hosts.micolash.programs.gnome-keyring
      self.hosts.micolash.programs.limine
      self.hosts.micolash.programs.niri
      self.hosts.micolash.programs.pipewire
      self.hosts.micolash.programs.sudo
      self.hosts.micolash.programs.v2rayn
      self.hosts.micolash.programs.xwayland-satellite

      #micolashServices
      self.hosts.micolash.services.chronyd
      self.hosts.micolash.services.dbus
      self.hosts.micolash.services.dhcpcd
      self.hosts.micolash.services.getty
      self.hosts.micolash.services.iwd
      self.hosts.micolash.services.keventd
      self.hosts.micolash.services.ly
      self.hosts.micolash.services.nix-daemon
      self.hosts.micolash.services.polkit
      self.hosts.micolash.services.seatd
      self.hosts.micolash.services.sysklogd

      #micolashSystem
      self.hosts.micolash.system.boot
      self.hosts.micolash.system.fileSystems
      self.hosts.micolash.system.hardware
      self.hosts.micolash.system.networking
      self.hosts.micolash.system.time
      self.hosts.micolash.system.user
    ];

    hjemModules = [
      #hjemModules
      self.hjemModules.fastfetch
      self.hjemModules.picom
    ];
  };
}
