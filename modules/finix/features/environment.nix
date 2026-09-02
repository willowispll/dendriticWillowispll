{
  flake.modules.finix.features.environment = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      alacritty
      gitMinimal
      nh
      nil
      nixd
      fastfetch
      brave-origin
      xdg-utils
      rofi
      (discord.override {
        withOpenASAR = true;
        withVencord = true;
      })
      picom
      pwvucontrol
      feh
      steam
      xrandr
      maim
      btop
      zed-editor
    ];
  };
}
