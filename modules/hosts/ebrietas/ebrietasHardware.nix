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
      device = "/dev/disk/by-uuid/7d0cca21-362a-4aaf-a5c2-c9492d4a93f7";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };
  };
}
