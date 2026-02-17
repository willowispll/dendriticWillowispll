{ pkgs, ... }:{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      catppuccin-fcitx5
      kdePackages.fcitx5-chinese-addons 
    ];
    fcitx5.waylandFrontend = true;
  };
}
