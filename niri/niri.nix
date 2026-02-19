{ pkgs, ... }:{
  programs.niri.enable = true;
  services.displayManager.ly.enable = true;
  environment.systemPackages = with pkgs; [
    mako fuzzel waybar adwaita-icon-theme
    waypaper swww xwayland-satellite
    pavucontrol bluejay
  ];
}
