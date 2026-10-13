{
  flake.hosts.micolash.system.boot = { pkgs, ... }: {
    boot = {
      kernelModules = [
        "tun"
        "kvm-amd"
      ];
      kernelParams = [ "loglevel=3" ];
      kernelPackages = pkgs.linuxPackages_latest;
      initrd.availableKernelModules = [
        "nvme"
        "xhci_pci"
        "usb_storage"
        "sd_mod"
      ];
    };
  };
}
