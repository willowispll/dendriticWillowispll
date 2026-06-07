{
  flake.nixosModules.systemPackages =
    {
      pkgs,
      inputs,
      ...
    }:
    {
      environment.systemPackages = with pkgs; [
        nil
        mpv
        nixd
        brightnessctl
        telegram-desktop
        onlyoffice-desktopeditors
        inputs.vtubfetch.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };
}
