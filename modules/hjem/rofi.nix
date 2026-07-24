{ self, inputs, ... }: {
  flake.hjemModules.rofi = let
    palette = inputs.basix.schemeData.base16.${self.theme.base16}.palette;
    font_family = "${self.theme.fontFamily}";
  in
    { lib, ... }: let
      mkLiteral = value: { _type = "literal"; inherit value; };
      p = builtins.mapAttrs (_: mkLiteral) palette;

      mkRasiValue = value:
        if builtins.isAttrs value && value._type or "" == "literal" then
          value.value
        else if builtins.isBool value then
          if value then "true" else "false"
        else if builtins.isInt value || builtins.isFloat value then
          toString value
        else if builtins.isList value then
          "[ ${lib.concatMapStringsSep ", " mkRasiValue value} ]"
        else
          ''"${toString value}"'';

      mkBlock = name: props:
        "${name} {\n${lib.concatStringsSep "\n" (lib.mapAttrsToList (k: v: "  ${k}: ${mkRasiValue v};") props)}\n}";

      generator = attrs:
        let
          names = builtins.attrNames attrs;
          sorted = lib.sort (a: b:
            if a == "configuration" then true
            else if b == "configuration" then false
            else a < b
          ) names;
        in
          lib.concatStringsSep "\n" (map (name: mkBlock name attrs.${name}) sorted);
    in {
      xdg.config.files."rofi/config.rasi" = {
        inherit generator;
        value = {
          configuration = {
            font = "${font_family} 10";
            modi = "drun,run,window";
            show-icons = true;
            display-drun = "";
            drun-display-format = "{icon} {name}";
          };

          "*" = {
            selected-active-foreground = p.base00;
            lightfg = p.base05;
            separatorcolor = p.base05;
            urgent-foreground = p.base08;
            alternate-urgent-background = p.base01;
            lightbg = p.base01;
            background-color = mkLiteral "transparent";
            border-color = p.base05;
            normal-background = p.base00;
            selected-urgent-background = p.base08;
            alternate-active-background = p.base01;
            spacing = 2;
            alternate-normal-foreground = p.base05;
            urgent-background = p.base00;
            selected-normal-foreground = p.base01;
            active-foreground = p.base0D;
            background = p.base00;
            selected-active-background = p.base0D;
            active-background = p.base00;
            selected-normal-background = p.base05;
            alternate-normal-background = p.base01;
            foreground = p.base05;
            selected-urgent-foreground = p.base00;
            normal-foreground = p.base05;
            alternate-urgent-foreground = p.base08;
            alternate-active-foreground = p.base0D;
          };

          element = {
            padding = mkLiteral "1px";
            cursor = mkLiteral "pointer";
            spacing = mkLiteral "5px";
            border = 0;
          };

          "element normal.normal" = {
            background-color = mkLiteral "@normal-background";
            text-color = mkLiteral "@normal-foreground";
          };

          "element normal.urgent" = {
            background-color = mkLiteral "@urgent-background";
            text-color = mkLiteral "@urgent-foreground";
          };

          "element normal.active" = {
            background-color = mkLiteral "@active-background";
            text-color = mkLiteral "@active-foreground";
          };

          "element selected.normal" = {
            background-color = mkLiteral "@selected-normal-background";
            text-color = mkLiteral "@selected-normal-foreground";
          };

          "element selected.urgent" = {
            background-color = mkLiteral "@selected-urgent-background";
            text-color = mkLiteral "@selected-urgent-foreground";
          };

          "element selected.active" = {
            background-color = mkLiteral "@selected-active-background";
            text-color = mkLiteral "@selected-active-foreground";
          };

          "element alternate.normal" = {
            background-color = mkLiteral "@alternate-normal-background";
            text-color = mkLiteral "@alternate-normal-foreground";
          };

          "element alternate.urgent" = {
            background-color = mkLiteral "@alternate-urgent-background";
            text-color = mkLiteral "@alternate-urgent-foreground";
          };

          "element alternate.active" = {
            background-color = mkLiteral "@alternate-active-background";
            text-color = mkLiteral "@alternate-active-foreground";
          };

          "element-text" = {
            background-color = mkLiteral "transparent";
            cursor = mkLiteral "inherit";
            highlight = mkLiteral "inherit";
            text-color = mkLiteral "inherit";
          };

          "element-icon" = {
            background-color = mkLiteral "transparent";
            size = mkLiteral "1.0000em";
            cursor = mkLiteral "inherit";
            text-color = mkLiteral "inherit";
          };

          window = {
            padding = 5;
            background-color = mkLiteral "@background";
            border = 1;
            width = 300;
          };

          mainbox = {
            padding = 0;
            border = 0;
          };

          message = {
            padding = mkLiteral "1px";
            border-color = mkLiteral "@separatorcolor";
            border = mkLiteral "2px dash 0px 0px";
          };

          textbox = {
            text-color = mkLiteral "@foreground";
          };

          listview = {
            padding = mkLiteral "2px 0px 0px";
            scrollbar = true;
            border-color = mkLiteral "@separatorcolor";
            spacing = mkLiteral "2px";
            fixed-height = 0;
            border = mkLiteral "2px dash 0px 0px";
          };

          scrollbar = {
            width = mkLiteral "4px";
            padding = 0;
            handle-width = mkLiteral "8px";
            border = 0;
            handle-color = mkLiteral "@normal-foreground";
          };

          sidebar = {
            border-color = mkLiteral "@separatorcolor";
            border = mkLiteral "2px dash 0px 0px";
          };

          button = {
            cursor = mkLiteral "pointer";
            spacing = 0;
            text-color = mkLiteral "@normal-foreground";
          };

          "button selected" = {
            background-color = mkLiteral "@selected-normal-background";
            text-color = mkLiteral "@selected-normal-foreground";
          };

          "num-filtered-rows" = {
            expand = false;
            text-color = mkLiteral "Gray";
          };

          "num-rows" = {
            expand = false;
            text-color = mkLiteral "Gray";
          };

          "textbox-num-sep" = {
            expand = false;
            str = "/";
            text-color = mkLiteral "Gray";
          };

          inputbar = {
            padding = mkLiteral "1px";
            spacing = mkLiteral "0px";
            text-color = mkLiteral "@normal-foreground";
            children = map mkLiteral [ "prompt" "textbox-prompt-colon" "entry" "num-filtered-rows" "textbox-num-sep" "num-rows" "case-indicator" ];
          };

          "case-indicator" = {
            spacing = 0;
            text-color = mkLiteral "@normal-foreground";
          };

          entry = {
            text-color = mkLiteral "@normal-foreground";
            cursor = mkLiteral "text";
            spacing = 0;
            placeholder-color = mkLiteral "Gray";
            placeholder = "Type to filter";
          };

          prompt = {
            spacing = 0;
            text-color = mkLiteral "@normal-foreground";
          };

          "textbox-prompt-colon" = {
            margin = mkLiteral "0px 0.3000em 0.0000em 0.0000em";
            expand = false;
            str = ":";
            text-color = mkLiteral "inherit";
          };
        };
      };
    };
}
