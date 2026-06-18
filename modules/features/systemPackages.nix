{
  flake.nixosModules.systemPackages =
    {
      pkgs,
      inputs,
      ...
    }:
    {
      environment.systemPackages = with pkgs; [
        telegram-desktop
        inputs.vtubfetch.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };
}
