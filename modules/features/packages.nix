{
  flake.nixosModules.packages =
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

      programs.nano.enable = false;
      documentation = {
        enable = false;
        man.enable = false;
      };
    };
}
