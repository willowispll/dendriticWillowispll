{
  flake.modules.hosts.ebrietas.fileSystems = {
    fileSystems."/" = {
      device = "/dev/disk/by-uuid/21c154e1-71a6-4452-a1d8-214732c2ad73";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/5D89-AF94";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    swapDevices = [
      {device = "/dev/disk/by-uuid/895848b5-8edb-46a0-be7f-d602b7ab9bc8";}
    ];
  };
}
