{
  flake.modules.hosts.ebrietas.boot = {pkgs, ...}: {
    boot = {
      kernelModules = ["tun"];
      kernelParams = ["loglevel=3"];
      kernelPackages = pkgs.linuxPackages_latest;
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
