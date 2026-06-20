{
  flake.nixosModules.ebrietasHardware = { pkgs, ... }: {
    hardware.firmware = [
      pkgs.linux-firmware
    ];
    boot.initrd.availableKernelModules = [
      "xhci_pci"
      "ahci"
      "usbhid"
      "usb_storage"
      "sd_mod"
    ];
    fileSystems."/" = {
      device = "/dev/disk/by-uuid/626d3679-91fc-4a25-a599-1a465c38678b";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/84D8-9924";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };
  };
}
