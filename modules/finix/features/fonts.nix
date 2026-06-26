{
  flake.nixosModules.finixFeaturesFonts = { pkgs, ... }: {
    fonts = {
      enableDefaultPackages = true;
      packages = with pkgs; [
        nerd-fonts.fira-code
      ];

      fontconfig = {
        enable = true;
      };
    };
  };
}
