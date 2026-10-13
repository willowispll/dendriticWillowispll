{
  flake.hosts.micolash.features.environment = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      alacritty
      waytrogen
      fuzzel
      brave-origin
      xdg-utils
      (discord.override {
        withOpenASAR = true;
        withVencord = true;
      })
      pwvucontrol
      zed-editor
      awww

      nh
      nil
      nixd
      btop
      fastfetch
      gitMinimal
    ];
  };
}
