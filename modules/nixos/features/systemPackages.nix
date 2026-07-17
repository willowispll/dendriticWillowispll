{
  flake.nixosModules.systemPackages =
    {
      pkgs,
      ...
    }:
    {
      environment.systemPackages = with pkgs; [
        telegram-desktop
      ];
    };
}
