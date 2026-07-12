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
        kitty
        oxwm
        inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.fastfetch
        inputs.glide.packages.${pkgs.stdenv.hostPlatform.system}.default
        rofi
        discord
        picom
        pavucontrol
        nitrogen
        steam
        xrandr
        scrot
        btop
      ];
    };
}
