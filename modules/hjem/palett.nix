{
  flake.hjemModules.palett = {pkgs, ...}: {
    palett = {
      enable = true;
      base16Scheme = "catppuccin-mocha";

      fonts = {
        monospace = {
          name = "FiraCode Nerd Font Mono";
          package = pkgs.nerd-fonts.fira-code;
        };
      };

      icons = {
        enable = true;
        light = "Adwaita";
        dark = "Adwaita";
        package = pkgs.adwaita-icon-theme;
      };

      targets = {
        fontconfig.enable = true;
        gtk.enable = true;
        qt.enable = true;

        kitty = {
          enable = true;
          fontSize = 10.0;
        };
        rofi = {
          enable = true;
          fontSize = 10;
        };
      };
    };
  };
}
