{ inputs, ... }: {
  flake.hosts.ebrietas.programs.sudo = {
    imports = [ inputs.finix.nixosModules.sudo ];
    programs.sudo.enable = true;
  };
}
