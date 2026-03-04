{ pkgs, ... }:{
  programs.niri.enable = true;
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    waypaper swww xwayland-satellite
    pavucontrol bluejay
  ];
}
