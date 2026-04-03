{
  flake.homeModules.helix = {
    pkgs,
    inputs,
    ...
  }: {
    programs.helix = {
      enable = true;
      settings.theme = "catppuccin_mocha";

      languages = {
        language-server.discord-rpc = {
          package = inputs.discord-rpc-lsp.packages.${pkgs.stdenv.hostPlatform.system}.default;
          command = "discord-rpc-lsp-flake";
        };

        language = [
          {
            name = "rust";
            language-servers = [
              "discord-rpc"
              "rust-analyzer"
            ];
          }
          {
            name = "nix";
            language-servers = [
              "discord-rpc"
              "nil"
            ];
          }
        ];
      };
    };
  };
}
