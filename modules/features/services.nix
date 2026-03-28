{
  flake.nixosModules.services = {
    services = {
      displayManager.ly.enable = true;
      blueman.enable = true;
    };
  };
}
