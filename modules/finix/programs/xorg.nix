{ inputs, ... }: {
  flake.modules.finix.programs.xorg = {
    imports = [ inputs.finix.nixosModules.xorg ];
    programs.xorg.enable = true;
  };
}
