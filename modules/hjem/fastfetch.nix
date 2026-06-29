{
  flake.hjemModules.fastfetch = { lib, ... }: {
    xdg.config.files."fastfetch/config.jsonc" = {
      generator = lib.generators.toJSON { };
      value = {
        display.separator = "  ";

        logo = {
          padding = {
            left = 4;
            top = 1;
          };
          type = "small";
        };

        modules = [
          "break"
          "title"

          {
            type = "os";
            key = "os     ";
            format = "{pretty-name}";
            keyColor = "33";
          }

          {
            type = "kernel";
            key = "kernel ";
            keyColor = "33";
          }

          {
            type = "cpu";
            format = "{1} ({8})";
            temp = true;
            key = "cpu    ";
            keyColor = "33";
          }

          {
            type = "gpu";
            format = "{2} ({4})";
            temp = true;
            key = "gpu    ";
            keyColor = "33";
          }

          {
            type = "memory";
            format = "";
            key = "mem    ";
            keyColor = "33";
          }

          {
            type = "packages";
            format = "{} (nix)";
            key = "pkgs   ";
            keyColor = "33";
          }

          {
            type = "uptime";
            format = "{2}h {3}m";
            key = "uptime ";
            keyColor = "33";
          }

          {
            type = "command";
            key = "OSage  ";
            keyColor = "33";
            text = ''
              birth_install=$(stat -c %W /)
              current=$(date +%s)
              time_progression=$((current - birth_install))
              days_difference=$((time_progression / 86400))
              echo $days_difference days
            '';
          }
        ];
      };
    };
  };
}
