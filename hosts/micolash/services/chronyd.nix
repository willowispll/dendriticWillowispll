{ inputs, ... }: {
  flake.hosts.micolash.services.chronyd = {
    imports = [ inputs.finix.nixosModules.chronyd ];
    services.chrony.enable = true;
  };
}
