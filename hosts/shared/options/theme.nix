{ lib, ... }: {
  flake.options.theme = lib.mkOption {
    readOnly = true;
    type = lib.types.attrsOf lib.types.str;
    default = {
      ebrietas = "catppuccin-mocha";
      micolash = "catppuccin-mocha";
    };
  };
}
