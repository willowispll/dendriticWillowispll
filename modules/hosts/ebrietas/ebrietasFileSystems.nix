{
  flake.nixosModules.ebrietasFileSystems = {
    fileSystems."/" = {
      device = "/dev/disk/by-uuid/603fbd3f-f970-4eb0-8f7d-4b826b145429";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/DDA1-534A";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };
  };
}
