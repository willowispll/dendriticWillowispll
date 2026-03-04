{ inputs, pkgs, ... }:{
  imports = [ inputs.stylix.homeModules.stylix ];
  stylix = {
    enable = true;
    autoEnable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    # fonts = {
      # packages = pkgs.monaspace;
      # monospace.name = "Monaspace Krypton";
      # serif.name = "Monaspace Argon";
      # sansSerif.name = "Monaspace Neon";

      # sizes.applications = 11;
      # sizes.desktop = 11;
      # sizes.popups = 11;
    # };
    
    targets = {
      gtk = {
        enable = true;
      };
      qt = {
        enable = true;
      };
      fuzzel = {
        enable = true;
      };
      mako = {
        enable = true;
      };
      foliate = {
        enable = true;
      };
    };
  };
}
