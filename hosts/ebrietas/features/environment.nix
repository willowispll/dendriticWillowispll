{
  flake.hosts.ebrietas.features.environment = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      gitMinimal
      #(discord.override {
      #  withOpenASAR = true;
      #  withVencord = true;
      #})
      nh
      nil
      firefox
      xdg-utils
      ncpamixer
      feh
      steam
      concord-tui
    ];

    environment.pathsToLink = [ "/share/applications" ];
  };
}
