{
  flake.nixosModules.nix =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        nil
        nixd
      ];
    };
}
