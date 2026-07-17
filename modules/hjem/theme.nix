{ lib, ... }: {
  flake.options.theme = lib.mkOption {
    readOnly = true;
    type = lib.types.attrsOf lib.types.str;
    default = {
      base16 = "grayscale-dark";
      fontFamily = "FiraCode Nerd Font Mono";
    };
  };
}
