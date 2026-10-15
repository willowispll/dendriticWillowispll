{ inputs, ... }: {
  flake.hosts.shared.services.chronyd = {
    imports = [ inputs.finix.nixosModules.chronyd ];
    services.chrony.enable = true;
  };
}
