{
  flake.nixosModules.nixosServicesTailscale = {
    services.tailscale.enable = true;
  };
}
