{
  flake.nixosModules.v2rayn =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.v2rayn
        pkgs.xray
        pkgs.sing-box
      ];
    };
}
