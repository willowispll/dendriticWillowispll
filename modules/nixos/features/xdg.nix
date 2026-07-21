{
  flake.nixosModules.xdg = {
    pkgs,
    lib,
    ...
  }: {
    xdg.portal = {
      enable = true;

      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];

      config = {
        niri = lib.mkForce {
          default = ["gtk"];

          "org.freedesktop.impl.portal.ScreenCast" = ["gnome"];
          "org.freedesktop.impl.portal.Screenshot" = ["gnome"];
        };
      };
    };
  };
}
