{
  flake.nixosModules.xdg =
    { pkgs, lib, ... }:
    {
      xdg.portal = {
        enable = true;

        extraPortals = with pkgs; [
          xdg-desktop-portal-wlr
          xdg-desktop-portal-gtk
        ];

        config = {
          niri = lib.mkForce {
            default = [ "gtk" ];

            "org.freedesktop.impl.portal.ScreenCast" = [ "wlr" ];
            "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
          };
        };
      };
    };
}
