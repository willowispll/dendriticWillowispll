{
  flake.nixosModules.packages = {
    pkgs,
    inputs,
    ...
  }: {
    environment.systemPackages = with pkgs; [
      nil
      lla
      nixd
      brightnessctl
      telegram-desktop
      onlyoffice-desktopeditors
      inputs.discord-rpc-lsp.packages.x86_64-linux.default
      inputs.vtubfetch.packages.x86_64-linux.default
    ];

    programs.nano.enable = false;
    documentation = {
      enable = false;
      man.enable = false;
    };
  };
}
