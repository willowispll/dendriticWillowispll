{ inputs, ... }: {
  flake.hosts.micolash.programs.sudo = {
    imports = [ inputs.finix.nixosModules.sudo ];
    programs.sudo.enable = true;
  };
}
