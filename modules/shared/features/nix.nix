{
  flake.modules.shared.features.nix =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        nil
        nixd
      ];
    };
}
