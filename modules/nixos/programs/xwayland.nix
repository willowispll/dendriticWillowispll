{
  flake.modules.nixos.programs.xwayland = {pkgs, ...}: {
    programs.xwayland = {
      enable = true;
      package = pkgs.xwayland-satellite;
    };
  };
}
