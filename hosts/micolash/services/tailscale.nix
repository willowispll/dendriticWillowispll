{ inputs, ... }: {
  flake.hosts.micolash.services.tailscale = {
    imports = [ inputs.finix-community-modules.nixosModules.tailscale ];
    services.tailscale.enable = true;
  };
}
