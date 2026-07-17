{
  flake.modules.hosts.ebrietas.hardware = { pkgs, ... }: {
    hardware = {
      firmware = [
        pkgs.linux-firmware
      ];
      graphics = {
        enable = true;
        enable32Bit = true;
      };
    };
  };
}
