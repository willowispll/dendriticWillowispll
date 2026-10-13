{ inputs, ... }: {
  flake.hosts.micolash.services.ly = {
    imports = [ inputs.finix.nixosModules.ly ];
    services.ly.enable = true;
  };
}
