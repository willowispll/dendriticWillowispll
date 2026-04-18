{
  flake.homeModules.helix = {
    programs.helix = {
      enable = true;
      settings.theme = "catppuccin_mocha";

      languages = {
        language = [
          {
            name = "rust";
            language-servers = [
              "rust-analyzer"
            ];
          }
          {
            name = "nix";
            language-servers = [
              "nil"
            ];
          }
        ];
      };
    };
  };
}
