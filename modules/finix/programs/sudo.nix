{ inputs, ... }: {
  flake.nixosModules.finixProgramsSudo = {
    imports = [ inputs.finix.nixosModules.sudo ];
    programs.sudo.enable = true;
  };
}
