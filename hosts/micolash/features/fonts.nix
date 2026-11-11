{
  flake.hosts.micolash.features.fonts = { pkgs, ... }: {
    fonts = {
      packages = [
        pkgs.noto-fonts
        pkgs.nerd-fonts.jetbrains-mono
      ];

      fontconfig = {
        enable = true;
        defaultFonts = {
          monospace = [ "JetBrainsMono Nerd Font" ];
          sansSerif = [ "Noto Sans" ];
          serif = [ "Noto Serif" ];
          emoji = [ "Noto Color Emoji" ];
        };
      };
    };
  };
}
