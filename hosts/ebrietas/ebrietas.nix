{ self, ... }:
let
  inherit (self.lib) mkSystem;
in
{
  flake.nixosConfigurations.ebrietas = mkSystem {
    finix = true;

    modules = [
      #sharedFeatures
      self.hosts.shared.features.finit
      self.hosts.shared.features.fonts

      #ebrietasFeatures
      self.hosts.ebrietas.features.environment
      self.hosts.ebrietas.features.hjem
      self.hosts.ebrietas.features.nixpkgs
      self.hosts.ebrietas.features.xdg

      #sharedPrograms
      self.hosts.shared.programs.bash
      self.hosts.shared.programs.coreutils
      self.hosts.shared.programs.pipewire
      self.hosts.shared.programs.sudo
      self.hosts.shared.programs.v2rayn

      #ebrietasPrograms
      self.hosts.ebrietas.programs.limine
      self.hosts.ebrietas.programs.sh
      self.hosts.ebrietas.programs.vxwm
      self.hosts.ebrietas.programs.xorg

      #sharedServices
      self.hosts.shared.services.chronyd
      self.hosts.shared.services.dbus
      self.hosts.shared.services.dhcpcd
      self.hosts.shared.services.getty
      self.hosts.shared.services.keventd
      self.hosts.shared.services.seatd
      self.hosts.shared.services.sysklogd

      #ebrietasServices
      self.hosts.ebrietas.services.ly
      self.hosts.ebrietas.services.nix-daemon

      #ebrietasSystem
      self.hosts.ebrietas.system.boot
      self.hosts.ebrietas.system.fileSystems
      self.hosts.ebrietas.system.hardware
      self.hosts.ebrietas.system.networking
      self.hosts.ebrietas.system.time
      self.hosts.ebrietas.system.user
    ];

    hjemModules = [
      #sharedHjem
      self.hjemModules.git
      self.hjemModules.gram
      self.hjemModules.picom
    ];
  };
}
