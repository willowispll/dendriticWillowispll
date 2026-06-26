{ inputs, ... }: {
  flake.nixosModules.finixProgramsXorg = {
    imports = [ inputs.finix.nixosModules.xorg ];
    programs.xorg.enable = true;
  };
}
