{inputs, ...}: {
  flake.modules.shared.programs.nvf = {
    imports = [inputs.nvf.nixosModules.default];
    programs.nvf = {
      enable = true;

      settings = {
        config.vim = {
          theme = {
            enable = true;
            name = "everforest";
            style = "medium";
          };

          options = {
            tabstop = 2;
            shiftwidth = 2;
            expandtab = true;
            smarttab = true;
          };

          git.enable = true;

          mini = {
            statusline.enable = true;
            pick.enable = true;
            tabline.enable = true;
            pairs.enable = true;
            comment.enable = true;
            icons.enable = true;
            starter.enable = true;
          };

          presence.neocord.enable = true;
          autocomplete.nvim-cmp.enable = true;
          filetree.neo-tree = {
            enable = true;
            setupOpts = {
              window = {
                width = 30;
              };
            };
          };

          languages = {
            enableLSP = true;
            enableTreesitter = true;

            nix.enable = true;
            rust.enable = true;
          };
        };
      };
    };
  };
}
