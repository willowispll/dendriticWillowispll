{
  flake.homeModules.kitty = {pkgs, ...}: {
    programs.kitty = {
      enable = true;
      themeFile = "Catppuccin-Mocha";
      config = {
        disableMinSize = true;
      };
      font = {
        package = pkgs.monaspace;
        name = "Monaspace Krypton";
        size = 10;
      };
    };
  };
}
