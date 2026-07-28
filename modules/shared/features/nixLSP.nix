{
  flake.modules.shared.features.nixLSP = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      nil
      nixd
    ];
  };
}
