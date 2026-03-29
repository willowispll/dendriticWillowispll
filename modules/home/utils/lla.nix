{
  flake.homeModules.lla = {
    pkgs,
    config,
    ...
  }: let
    tomlFormat = pkgs.formats.toml {};
  in {
    xdg.configFile."lla/config.toml".source = tomlFormat.generate "lla-config" {
      default_sort = "name";
      default_format = "table";
      show_icons = true;
      include_dirs = true;
      permission_format = "symbolic";
      theme = "catppuccin_mocha.toml";
      enabled_plugins = [];
      plugins_dir = config.xdg.configHome + "/lla/plugins";
      exclude_paths = [];
      default_depth = 10;
      editor = "";

      sort = {
        dirs_first = true;
        case_sensitive = true;
        natural = true;
      };

      filter = {
        case_sensitive = true;
        no_dotfiles = false;
        respect_gitignore = true;
      };

      formatters = {
        tree = {
          max_lines = 20000;
        };
        grid = {
          ignore_width = false;
          max_width = 200;
        };
        long = {
          hide_group = false;
          relative_dates = false;
          columns = [
            "name"
            "permissions"
            "size"
            "modified"
            "user"
            "group"
          ];
        };
        table = {
          columns = [
            "name"
            "modified"
            "size"
            "permissions"
          ];
        };
      };

      listers = {
        recursive = {
          max_entries = 20000;
        };
        fuzzy = {
          ignore_patterns = [
            "node_modules"
            "target"
            ".git"
            ".idea"
            ".vscode"
          ];
        };
      };
    };

    xdg.configFile."lla/themes/catppuccin_mocha.toml".text = ''
      name = "catppuccin_mocha"
      author = "Mohamed Achaq"
      description = "A soothing pastel theme for the high-spirited, featuring warm, cozy colors"

      [colors]
      file = "#CDD6F4"
      directory = "#89B4FA"
      symlink = "#CBA6F7"
      executable = "#A6E3A1"

      size = "#6C7086"
      date = "#6C7086"
      user = "#F5C2E7"
      group = "#6C7086"

      permission_dir = "#89B4FA"
      permission_read = "#A6E3A1"
      permission_write = "#F5C2E7"
      permission_exec = "#F38BA8"
      permission_none = "#6C7086"

      [special_files]
      [special_files.folders]
      "node_modules" = { h = 0, s = 0, l = 0.15 }
      "target" = "#6C7086"
      "dist" = "#6C7086"
      ".git" = "#89B4FA"
      "build" = "#6C7086"
      ".cache" = "#6C7086"
      "*-env" = "#A6E3A1"
      "venv" = "#A6E3A1"
      ".env" = "#A6E3A1"
      "*.d" = "#CBA6F7"
      "*_cache" = "#6C7086"
      "*-cache" = "#6C7086"

      [special_files.dotfiles]
      ".gitignore" = "#94E2D5"
      ".env" = "#89B4FA"
      ".dockerignore" = "#94E2D5"
      ".editorconfig" = "#94E2D5"
      ".prettierrc" = "#94E2D5"
      ".eslintrc" = "#94E2D5"
      ".babelrc" = "#94E2D5"

      [special_files.exact_match]
      "Dockerfile" = "#94E2D5"
      "docker-compose.yml" = "#94E2D5"
      "Makefile" = "#F38BA8"
      "CMakeLists.txt" = "#F38BA8"
      "README.md" = "#89B4FA"
      "LICENSE" = "#89B4FA"
      "package.json" = "#89B4FA"
      "Cargo.toml" = "#F38BA8"
      "go.mod" = "#94E2D5"
      "flake.nix" = "#89B4FA"
      "flake.lock" = "#6C7086"
      "shell.nix" = "#89B4FA"
      "default.nix" = "#89B4FA"

      [special_files.patterns]
      "*rc" = "#94E2D5"
      "*.min.*" = "#6C7086"
      "*.test.*" = "#A6E3A1"
      "*.spec.*" = "#A6E3A1"
      "*.lock" = "#6C7086"
      "*.config.*" = "#94E2D5"

      [extensions.groups]
      rust = ["rs", "toml"]
      python = ["py", "pyi", "pyw", "ipynb"]
      javascript = ["js", "mjs", "cjs", "jsx"]
      typescript = ["ts", "tsx", "d.ts"]
      java = ["java", "jar", "class"]
      csharp = ["cs", "csx"]
      cpp = ["cpp", "cc", "cxx", "c++", "hpp", "hxx", "h++"]
      go = ["go"]
      ruby = ["rb", "erb"]
      php = ["php", "phtml"]
      swift = ["swift"]
      kotlin = ["kt", "kts"]
      nix = ["nix"]

      markup = ["html", "htm", "xhtml", "xml", "svg", "vue", "wasm", "ejs"]
      style = ["css", "scss", "sass", "less", "styl"]
      web_config = ["json", "json5", "yaml", "yml", "toml", "ini", "conf", "config"]

      shell = ["sh", "bash", "zsh", "fish", "ps1", "psm1", "psd1"]
      script = ["pl", "pm", "t", "tcl", "lua", "vim", "vimrc", "r"]

      doc = [
          "md",
          "rst",
          "txt",
          "org",
          "wiki",
          "adoc",
          "tex",
          "pdf",
          "epub",
          "doc",
          "docx",
          "rtf",
      ]

      image = ["png", "jpg", "jpeg", "gif", "bmp", "tiff", "webp", "ico", "heic"]
      video = ["mp4", "webm", "mov", "avi", "mkv", "flv", "wmv", "m4v", "3gp"]
      audio = ["mp3", "wav", "ogg", "m4a", "flac", "aac", "wma"]

      data = ["csv", "tsv", "sql", "sqlite", "db", "json", "xml", "yaml", "yml"]
      archive = ["zip", "tar", "gz", "bz2", "xz", "7z", "rar", "iso", "dmg"]

      [extensions.colors]
      rust = "#F38BA8"
      python = "#A6E3A1"
      javascript = "#F9E2AF"
      typescript = "#94E2D5"
      java = "#F38BA8"
      csharp = "#A6E3A1"
      cpp = "#F38BA8"
      go = "#94E2D5"
      ruby = "#F38BA8"
      php = "#A6E3A1"
      swift = "#F38BA8"
      kotlin = "#A6E3A1"
      nix = "#94E2D5"

      markup = "#F5C2E7"
      style = "#A6E3A1"
      web_config = "#89B4FA"

      shell = "#A6E3A1"
      script = "#89B4FA"

      doc = "#CDD6F4"

      image = "#FAB387"
      video = "#FAB387"
      audio = "#FAB387"

      data = "#89B4FA"
      archive = "#F38BA8"

      rs = "#F38BA8"
      py = "#A6E3A1"
      js = "#F9E2AF"
      ts = "#94E2D5"
      jsx = "#F9E2AF"
      tsx = "#94E2D5"
      vue = "#A6E3A1"
      css = "#A6E3A1"
      scss = "#A6E3A1"
      html = "#F5C2E7"
      md = "#CDD6F4"
      json = "#89B4FA"
      yaml = "#89B4FA"
    '';
  };
}
