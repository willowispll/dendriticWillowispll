{
  flake.nixosModules.ly = {
    services.displayManager.ly.enable = true;
    services.tailscale.enable = true;
  };
}
