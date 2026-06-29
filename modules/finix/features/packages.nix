{ inputs, ... }: {
  flake.modules.finix.features.packages =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        git
        nixos-rebuild-ng
        iproute2
        iputils
        nh
        oxwm
        st
        inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.fastfetch
        rofi
      ];
    };
}
