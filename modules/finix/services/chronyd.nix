{inputs, ...}: {
  flake.modules.finix.services.chronyd = {
    imports = [inputs.finix.nixosModules.chronyd];
    services.chrony.enable = true;
  };
}
