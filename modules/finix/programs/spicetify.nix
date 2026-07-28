{inputs, ...}: {
  flake.modules.finix.programs.spicetify = {pkgs, ...}: {
    imports = [inputs.spicetify-nix.nixosModules.spicetify];

    programs = let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
    in {
      spicetify = {
        enable = true;
        enabledExtensions = with spicePkgs.extensions; [
          adblockify
          shuffle
        ];
        theme = spicePkgs.themes.catppuccin;
        colorScheme = "mocha";
      };
    };
  };
}
