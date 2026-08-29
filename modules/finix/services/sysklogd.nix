{inputs, ...}: {
  flake.modules.finix.services.sysklogd = {
    imports = [inputs.finix.nixosModules.sysklogd];
    services.sysklogd.enable = true;
  };
}
