{ inputs, ... }: {
  flake.hosts.ebrietas.services.openssh = {
    imports = [ inputs.finix.nixosModules.openssh ];
    services.openssh.enable = true;
  };
}
