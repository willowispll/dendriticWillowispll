{
  flake.modules.nixos.services.tailscale = {
    services.tailscale.enable = true;
  };
}
