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
        nixd
        tree
        v2rayn
        telegram-desktop
        onlyoffice-desktopeditors
        inputs.discord-rpc-lsp.packages.x86_64-linux.default
        inputs.onelock.packages.${pkgs.stdenv.hostPlatform.system}.dott-tui
      ];

      programs.nano.enable = false;
      documentation = {
        enable = false;
        man.enable = false;
      };
    };
}
