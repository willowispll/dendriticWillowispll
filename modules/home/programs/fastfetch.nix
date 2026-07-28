{
  flake.homeModules.fastfetch = {
    programs.fastfetch = {
      enable = true;

      settings = {
        logo = {
          type = "small";
          padding = {
            top = 1;
            left = 4;
          };
        };

        display.separator = "  ";

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
              machine_id_created=$(stat -c '%Y' /etc/machine-id 2>/dev/null)
              if [ -n "$machine_id_created" ] && [ "$machine_id_created" -ge 0 ] 2>/dev/null; then
                echo $((($(date +%s) - machine_id_created) / 86400)) days
              else
                echo unknown
              fi
            '';
          }
        ];
      };
    };
  };
}
