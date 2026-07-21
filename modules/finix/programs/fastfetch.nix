{inputs, ...}: {
  flake.modules.finix.programs.fastfetch = {
    imports = [inputs.finix-community-modules.nixosModules.fastfetch];
    programs.fastfetch.enable = true;
  };
}
