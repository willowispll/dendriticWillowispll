{inputs, ...}: {
  flake.modules.finix.programs.doas = {
    imports = [inputs.finix.nixosModules.doas];
    programs.doas.enable = true;
  };
}
