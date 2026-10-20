{
  flake.hosts.micolash.features.environment = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      kitty
      waytrogen
      fuzzel
      brave-origin
      xdg-utils
      concord-tui
      ncpamixer
      gram
      awww

      epy
      onlyoffice-desktopeditors

      nh
      nil
      btop
      fastfetch
      gitMinimal
    ];
  };
}
