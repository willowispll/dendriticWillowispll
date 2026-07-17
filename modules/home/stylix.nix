{
  inputs,
  ...
}:
{
  flake.homeModules.stylix =
    { pkgs, ... }:
    {
      imports = [ inputs.stylix.homeModules.stylix ];

      stylix = {
        enable = true;
        autoEnable = false;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

        targets = {
          gtk.enable = true;
          qt.enable = true;

          anki.enable = true;
          foliate.enable = true;
          fuzzel.enable = true;
          obsidian.enable = true;
          zed.enable = true;

          mako.enable = true;
        };
      };
    };
}
