{inputs, ...}: {
  flake.modules.finix.services.polkit = {
    imports = [inputs.finix.nixosModules.polkit];
    services.polkit.enable = true;
  };
}
