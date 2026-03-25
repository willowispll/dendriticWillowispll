{
  flake.nixosModules.niri = {
    pkgs,
    inputs,
    ...
  }: {
    programs.niri.package = inputs.niri.packages.x86_64-linux.default;
    programs.niri.enable = true;

    environment.systemPackages = with pkgs; [
      adwaita-icon-theme
      waypaper
      swww
      xwayland-satellite
      pavucontrol
    ];
  };
}
