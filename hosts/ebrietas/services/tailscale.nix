{ inputs, ... }: {
  flake.hosts.ebrietas.services.tailscale = {
    imports = [ inputs.finix-community-modules.nixosModules.tailscale ];
    services.tailscale.enable = true;
  };
}
