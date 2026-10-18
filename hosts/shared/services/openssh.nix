{ inputs, ... }: {
  flake.hosts.shared.services.openssh = {
    imports = [ inputs.finix.nixosModules.openssh ];
    services.openssh.enable = true;
  };
}
