{
  flake.hosts.ebrietas.features.environment = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      gitMinimal
      jujutsu
      nh
      nil
      fastfetch
      firefox
      xdg-utils
      pwvucontrol
      feh
      steam
      btop
      gram
      concord-tui
    ];
  };
}
