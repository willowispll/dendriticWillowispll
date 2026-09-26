{
  flake.hosts.ebrietas.system.hardware = {pkgs, ...}: {
    hardware = {
      firmware = [pkgs.linux-firmware];
      graphics.enable = true;
    };
  };
}
