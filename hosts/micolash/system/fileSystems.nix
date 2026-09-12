{
  flake.hosts.micolash.system.fileSystems = {
    fileSystems."/" = {
      device = "/dev/disk/by-uuid/44075d82-375a-4792-bfae-8723c7e1e63d";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/4D75-7A48";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    swapDevices = [
      {device = "/dev/disk/by-uuid/a352a7ee-ed11-4c62-93c8-24569dbc9361";}
    ];
  };
}
