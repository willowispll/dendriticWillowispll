{ self, ... }:
let
  inherit (self.lib) mkSystem;
in
{
  flake.nixosConfigurations.micolash = mkSystem {
    finix = true;

    modules = [
      #sharedFeatures
      self.hosts.shared.features.finit
      self.hosts.shared.features.fonts

      #micolashFeatures
      self.hosts.micolash.features.environment
      self.hosts.micolash.features.hjem
      self.hosts.micolash.features.nixpkgs
      self.hosts.micolash.features.xdg

      #sharedPrograms
      self.hosts.shared.programs.bash
      self.hosts.shared.programs.coreutils
      self.hosts.shared.programs.pipewire
      self.hosts.shared.programs.sudo
      self.hosts.shared.programs.v2rayn

      #micolashPrograms
      self.hosts.micolash.programs.gnome-keyring
      self.hosts.micolash.programs.limine
      self.hosts.micolash.programs.niri
      self.hosts.micolash.programs.xwayland-satellite

      #sharedServices
      self.hosts.shared.services.chronyd
      self.hosts.shared.services.dbus
      self.hosts.shared.services.dhcpcd
      self.hosts.shared.services.getty
      self.hosts.shared.services.keventd
      self.hosts.shared.services.openssh
      self.hosts.shared.services.seatd
      self.hosts.shared.services.sysklogd
      self.hosts.shared.services.tailscale

      #micolashServices
      self.hosts.micolash.services.iwd
      self.hosts.micolash.services.ly
      self.hosts.micolash.services.nix-daemon
      self.hosts.micolash.services.polkit

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
      self.hjemModules.gram
      self.hjemModules.picom
    ];
  };
}
