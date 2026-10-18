{ inputs, ... }: {
  flake.hosts.shared.services.tailscale = {
    imports = [ inputs.finix-community-modules.nixosModules.tailscale ];
    services.tailscale.enable = true;
  };
}
