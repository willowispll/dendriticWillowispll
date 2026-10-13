{ inputs, ... }: {
  flake.hosts.ebrietas.services.chronyd = {
    imports = [ inputs.finix.nixosModules.chronyd ];
    services.chrony.enable = true;
  };
}
