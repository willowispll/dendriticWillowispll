{
  flake.hjemModules.picom = {lib, ...}: {
    xdg.config.files."picom/picom.conf" = {
      generator = let
        mkValue = value:
          if builtins.isList value
          then "(\n${
            lib.concatMapStringsSep ",\n" (
              item:
                if builtins.isAttrs item
                then "{\n${mkAttrs item "  "}\n}"
                else if builtins.isString item
                then ''"${item}"''
                else toString item
            )
            value
          }\n)"
          else if builtins.isBool value
          then
            if value
            then "true"
            else "false"
          else if builtins.isString value
          then ''"${value}"''
          else toString value;
        mkAttrs = attrs: indent:
          lib.concatStringsSep "\n" (
            lib.mapAttrsToList (key: value: "${indent}${key} = ${mkValue value};") attrs
          );
        generator = attrs:
          lib.concatStringsSep "\n" (lib.mapAttrsToList (key: value: "${key} = ${mkValue value}") attrs);
      in
        generator;
      value = {
        backend = "glx";
        blur-method = "dual_kawase";
        blur-strength = 2;
        unredir-if-possible = true;
        rules = [
          {
            match = "focused";
            opacity = 0.9;
            blur-background = true;
          }
          {
            match = "!focused";
            opacity = 0.9;
            blur-background = true;
          }
          {
            match = "name *?= 'youtube'|| name *?= 'AnimeLIB' || fullscreen";
            opacity = 1;
            blur-background = false;
          }
        ];
      };
    };
  };
}
