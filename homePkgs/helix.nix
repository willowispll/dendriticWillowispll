{...}: {
  programs.helix = {
    enable = true;
    settings.theme = "catppuccin_mocha";

    languages = {
      language-server.discord-rpc = {
        command = "/run/current-system/sw/bin/discord-rpc-lsp-flake";
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
}
