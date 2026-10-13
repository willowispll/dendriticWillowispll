{ inputs, ... }: {
  flake.hosts.micolash.services.iwd = {
    imports = [ inputs.finix.nixosModules.iwd ];
    services.iwd.enable = true;
  };
}
