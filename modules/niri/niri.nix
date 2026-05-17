{
  flake.nixosModules.niri =
    {
      pkgs,
      ...
    }:
    {
      programs.niri.enable = true;
      programs.xwayland = {
        enable = true;
        package = pkgs.xwayland-satellite;
      };
      environment.systemPackages = with pkgs; [
        adwaita-icon-theme
        waypaper
        awww
        pavucontrol
      ];
    };
}
