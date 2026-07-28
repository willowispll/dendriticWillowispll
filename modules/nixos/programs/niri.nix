{
  flake.modules.nixos.programs.niri = {pkgs, ...}: {
    programs.niri.enable = true;
    environment.systemPackages = with pkgs; [
      adwaita-icon-theme
      waypaper
      awww
      pavucontrol
    ];
  };
}
