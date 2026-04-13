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
        lla
        nixd
        brightnessctl
        telegram-desktop
        onlyoffice-desktopeditors
        inputs.discord-rpc-lsp.packages.${pkgs.stdenv.hostPlatform.system}.default
        inputs.vtubfetch.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];

      programs.nano.enable = false;
      documentation = {
        enable = false;
        man.enable = false;
      };
    };
}
