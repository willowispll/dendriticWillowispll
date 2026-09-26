{
  flake.hosts.ebrietas.features.environment = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      kitty
      gitMinimal
      nh
      nil
      nixd
      fastfetch
      firefox
      xdg-utils
      rofi
      picom
      pwvucontrol
      feh
      steam
      xrandr
      maim
      btop
      gram
      concord-tui
    ];
  };
}
