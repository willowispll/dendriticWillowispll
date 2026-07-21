{inputs, ...}: {
  flake.modules.finix.programs.mangowc = {
    imports = [inputs.finix.nixosModules.mangowc];
    programs.mangowc.enable = true;
  };
}
