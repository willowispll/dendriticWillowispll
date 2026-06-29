{
  flake.modules.hosts.ebrietas.fileSystems = { lib, ... }: {
    fileSystems."/" = lib.mkForce {
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
    fileSystems."/nix" = {
      device = "/dev/disk/by-uuid/9cbe0bcb-da94-477c-86a9-bb4b4d50bf10";
      fsType = "ext4";
      options = [ "X-mount.subdir=nix" ];
    };
  };
}
