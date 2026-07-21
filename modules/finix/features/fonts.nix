{
  flake.modules.finix.features.fonts = {pkgs, ...}: {
    fonts = {
      enableDefaultPackages = true;
      packages = with pkgs; [
        nerd-fonts.fira-code
      ];

      fontconfig = {
        enable = true;
        defaultFonts.monospace = ["FiraCode Nerd Font Mono"];
      };
    };
  };
}
