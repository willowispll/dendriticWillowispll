{
  flake.nixosModules.finixPackages =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        helix
        git
        nixos-rebuild-ng
        iproute2
        nh
        oxwm
        st
      ];
    };
}
