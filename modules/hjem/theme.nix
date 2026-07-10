{ lib, ... }: {
  flake.options.theme = lib.mkOption {
    readOnly = true;
    type = lib.types.attrsOf lib.types.str;
    default = {
      base16 = "woodland";
      fontFamily = "FiraCode Nerd Font Mono";
    };
  };
}
