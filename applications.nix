{ pkgs, inputs, ... }:{
  environment.systemPackages = with pkgs; [
    nil v2rayn sing-box
    fastfetch
    telegram-desktop
    prismlauncher heroic
    onlyoffice-desktopeditors obsidian
    inputs.discord-rpc-lsp.packages.x86_64-linux.default    
    inputs.glide.packages.x86_64-linux.default
  ];
  services.sing-box.enable = true;
  
  programs.steam.enable = true;
  
  #Remove packages here:
  programs.nano.enable = false;
  documentation.enable = false;
}
