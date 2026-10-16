{
  flake.hjemModules.gram = { lib, ... }: {
    xdg.config.files."gram/settings.jsonc" = {
      generator = lib.generators.toJSON { };
      value = {
        base_keymap = "VSCode";

        theme = {
          mode = "dark";
          light = "Catppuccin Latte";
          dark = "Catppuccin Mocha";
        };
        icon_theme = {
          mode = "dark";
          light = "Gram (Default)";
          dark = "Gram (Default)";
        };

        ui_font_size = 14;
        buffer_font_size = 14;
        ui_font_family = "JetBrainsMono Nerd Font";
        buffer_font_family = "JetBrainsMono Nerd Font";

        languages.Nix.tab_size = 2;

        tabs = {
          file_icons = true;
          git_status = true;
        };
        status_bar = {
          cursor_position_button = true;
          active_language_button = true;
          active_file = true;
          position = "bottom";
          show = true;
        };
        tab_bar = {
          show_tab_bar_buttons = true;
          show = true;
        };
        title_bar = {
          show_menus = false;
          show_onboarding_banner = true;
          show_project_items = true;
          show_branch_name = true;
          show_branch_icon = true;
          show = true;
        };

        debugger.button = false;
        diagnostics.button = true;
        project_panel.button = true;
        search.button = false;
        terminal.button = true;
      };
    };
  };
}
