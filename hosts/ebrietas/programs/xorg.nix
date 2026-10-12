{inputs, ...}: {
  flake.hosts.ebrietas.programs.xorg = {pkgs, ...}: {
    imports = [inputs.finix.nixosModules.xorg];
    programs.xorg = {
      enable = true;
      modules = [pkgs.xf86-video-amdgpu];
      xkb = {
        layout = "us, ru";
        options = "grp:win_space_toggle";
      };
    };
    environment.etc."X11/xorg.conf.d/20-amdgpu.conf".text = ''
      Section "Device"
          Identifier "AMD"
          Driver "amdgpu"
          Option "TearFree" "true"
      EndSection
    '';
  };
}
