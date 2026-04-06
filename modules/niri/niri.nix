{
  flake.nixosModules.niri = {
    pkgs,
    inputs,
    ...
  }: {
    #programs.niri.package = inputs.niri.packages.x86_64-linux.default;
    programs.niri.enable = true;
    programs.xwayland = {
      enable = true;
      package = pkgs.xwayland-satellite;
    };
    environment.systemPackages = with pkgs; [
      adwaita-icon-theme
      waypaper
      awww
      pavucontrol
    ];
  };
}
