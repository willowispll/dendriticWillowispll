{
  flake.nixosModules.nixosProgramsNiri =
    {
      pkgs,
      ...
    }:
    {
      programs.niri.enable = true;
      environment.systemPackages = with pkgs; [
        adwaita-icon-theme
        waypaper
        awww
        pavucontrol
      ];
    };
}
