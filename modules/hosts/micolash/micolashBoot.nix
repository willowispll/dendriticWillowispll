{
  flake.nixosModules.micolashBoot =
    { pkgs, ... }:
    {
      boot = {
        loader = {
          limine.enable = true;
          limine.secureBoot.enable = true;
          limine.style.wallpapers = [ ];
          limine.extraEntries = ''
            /Windows
              protocol: efi
            path: uuid(f7bdeb2c-5693-4ee0-ab22-917604cec2b2):/EFI/Microsoft/Boot/bootmgfw.efi
          '';
          efi.canTouchEfiVariables = true;
        };
        initrd = {
          availableKernelModules = [
            "xhci_pci"
            "ahci"
            "usbhid"
            "usb_storage"
            "sd_mod"
          ];
          kernelModules = [ ];
        };
        kernelModules = [ "kvm-intel" ];
        extraModulePackages = [ ];
        kernelPackages = pkgs.linuxPackages_latest;
      };
    };
}
