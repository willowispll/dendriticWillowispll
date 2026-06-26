{
  flake.nixosModules.ebrietasHardware = { pkgs, ... }: {
    hardware = {
      firmware = [
        pkgs.linux-firmware
      ];
      graphics.enable = true;
    };
  };
}
