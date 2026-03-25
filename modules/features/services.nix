{
  flake.nixosModules.services = {
    services = {
      displayManager.ly.enable = true;
      sing-box.enable = true;
      blueman.enable = true;
    };
  };
}
