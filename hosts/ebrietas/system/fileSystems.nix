{
  flake.hosts.ebrietas.system.fileSystems = {
    fileSystems."/" = {
      device = "/dev/disk/by-uuid/54f48601-bf7e-47a1-9bbc-97192eb1b2b3";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/4974-0F28";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
      ];
    };

    swapDevices = [];
  };
}
