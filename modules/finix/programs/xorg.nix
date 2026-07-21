{inputs, ...}: {
  flake.modules.finix.programs.xorg = {
    imports = [inputs.finix.nixosModules.xorg];
    programs.xorg = {
      enable = true;
      xkb = {
        layout = "us, ru";
        options = "grp:win_space_toggle";
      };
    };
  };
}
