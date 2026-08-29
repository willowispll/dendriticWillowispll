{inputs, ...}: {
  flake.modules.finix.programs.xorg = {pkgs, ...}: {
    imports = [inputs.finix.nixosModules.xorg];
    programs.xorg = {
      enable = true;
      modules = [pkgs.xf86-video-amdgpu];
      xkb = {
        layout = "us, ru";
        options = "grp:win_space_toggle";
      };
    };
  };
}
