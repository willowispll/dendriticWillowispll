{
  flake.nixosModules.nixLSP =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        nil
        nixd
      ];
    };
}
