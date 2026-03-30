{
  flake.nixosModules.v2rayn = {pkgs, ...}: {
    services.sing-box.enable = true;
    environment.systemPackages = [pkgs.v2rayn];
  };
}
