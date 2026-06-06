{
  flake.nixosModules.xdg =
    { pkgs, ... }:
    {
      xdg.portal = {
        enable = true;
        config = {
          common = {
            default = [ "gnome" ];
          };
          niri = {
            default = [ "gnome;gtk" ];
          };
        };
        extraPortals = [
          pkgs.xdg-desktop-portal-gnome
          pkgs.xdg-desktop-portal-gtk
        ];
      };
    };
}
