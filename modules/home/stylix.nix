{
  flake.homeModules.stylix =
    {
      inputs,
      pkgs,
      ...
    }:
    {
      imports = [ inputs.stylix.homeModules.stylix ];

      stylix = {
        enable = true;
        autoEnable = false;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

        targets = {
          gtk.enable = true;
          qt.enable = true;
          fuzzel.enable = true;
          mako.enable = true;
          foliate.enable = true;
          zed.enable = true;
          obsidian.enable = true;
          anki.enable = true;
        };
      };
    };
}
