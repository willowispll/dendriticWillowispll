{
  flake.nixosModules.nixosProgramsXwayland = { pkgs, ... }: {
    programs.xwayland = {
      enable = true;
      package = pkgs.xwayland-satellite;
    };
  };
}
