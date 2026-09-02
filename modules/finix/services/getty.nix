{inputs, ...}: {
  flake.modules.finix.services.getty = {
    imports = [inputs.finix.nixosModules.getty];
    services.getty.enable = true;
  };
}
