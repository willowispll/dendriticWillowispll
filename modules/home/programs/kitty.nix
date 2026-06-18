{
  flake.homeModules.kitty =
    { pkgs, ... }:
    {
      programs.kitty = {
        enable = true;
        themeFile = "Catppuccin-Mocha";
        font = {
          package = pkgs.monaspace;
          name = "Monaspace Krypton";
          size = 10;
        };
      };
    };
}
