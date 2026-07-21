{inputs, ...}: {
  flake.modules.finix.programs.sudo = {
    imports = [inputs.finix.nixosModules.sudo];
    programs.sudo.enable = true;
  };
}
