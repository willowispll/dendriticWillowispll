{inputs, ...}: {
  flake.modules.finix.services.dhcpcd = {
    imports = [inputs.finix.nixosModules.dhcpcd];
    services.dhcpcd.enable = true;
  };
}
