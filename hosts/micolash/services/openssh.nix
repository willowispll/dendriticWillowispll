{ inputs, ... }: {
  flake.hosts.micolash.services.openssh = {
    imports = [ inputs.finix.nixosModules.openssh ];
    services.openssh.enable = true;
  };
}
