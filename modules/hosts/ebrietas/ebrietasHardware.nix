{
  flake.nixosModules.ebrietasHardware = { pkgs, ... }: {
    hardware.firmware = [
      pkgs.linux-firmware
    ];
  };
}
