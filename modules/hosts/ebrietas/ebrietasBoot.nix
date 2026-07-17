{
  flake.modules.hosts.ebrietas.boot = {
    boot = {
      kernelModules = [ "tun" ];
      kernelParams = [ "loglevel=3" ];
      initrd.availableKernelModules = [
        "xhci_pci"
        "ahci"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
    };
  };
}
