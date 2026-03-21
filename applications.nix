{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    nil
    nixd
    v2rayn
    tree
    telegram-desktop
    prismlauncher
    heroic
    onlyoffice-desktopeditors
    inputs.discord-rpc-lsp.packages.x86_64-linux.default
  ];

  services = {
    sing-box.enable = true;
    displayManager.ly.enable = true;
    blueman.enable = true;
  };

  programs.steam.enable = true;

  #Remove packages here:
  programs.nano.enable = false;
  documentation = {
    enable = false;
    man.enable = false;
  };
}
