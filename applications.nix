{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    nil
    nixd
    v2rayn
    sing-box
    tree
    telegram-desktop
    prismlauncher
    heroic
    onlyoffice-desktopeditors
    obsidian
    inputs.discord-rpc-lsp.packages.x86_64-linux.default
    inputs.glide.packages.x86_64-linux.default
  ];

  services.sing-box.enable = true;
  services.displayManager.ly = {
    enable = true;
  };
  services.blueman.enable = true;
  programs.steam.enable = true;

  #Remove packages here:
  programs.nano.enable = false;
  documentation = {
    enable = false;
    man.enable = false;
  };
}
