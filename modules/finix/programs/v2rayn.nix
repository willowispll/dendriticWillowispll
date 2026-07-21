{inputs, ...}: {
  flake.modules.finix.programs.v2rayn = {
    imports = [inputs.finix-community-modules.nixosModules.v2rayn];
    programs.v2rayn.enable = true;
  };
}
