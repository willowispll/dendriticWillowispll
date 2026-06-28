{
  flake.nixosModules.finixPackages =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        helix
        git
        nixos-rebuild-ng
        iproute2
        iputils
        nh
        oxwm
        st
      ];
    };
}
