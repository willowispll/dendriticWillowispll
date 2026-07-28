{
  flake.modules.nixos.features.systemPackages = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      telegram-desktop
    ];
  };
}
