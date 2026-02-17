{ pkgs, inputs, ... }:{
  environment.systemPackages = with pkgs; [
    nil v2rayn sing-box
    fastfetch git
    telegram-desktop (discord.override {withVencord = true;}) 
    prismlauncher heroic
    onlyoffice-desktopeditors obsidian
    inputs.discord-rpc-lsp.packages.x86_64-linux.default    
    inputs.glide.packages.x86_64-linux.default
    inputs.vtubfetch.packages.x86_64-linux.default
  ];
  services.sing-box.enable = true;
  programs.bash.interactiveShellInit = "${pkgs.fastfetch}/bin/fastfetch";
  
  programs.steam = {
    enable = true;
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/etc/nixos/";
  };
  
  #Remove packages here:
  programs.nano.enable = false;
  documentation.enable = false;
}
