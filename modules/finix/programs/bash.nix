{inputs, ...}: {
  flake.modules.finix.programs.bash = {
    imports = [inputs.finix.nixosModules.bash];
    programs.bash.enable = true;
  };
}
