{
  flake.nixosModules.finixPackages =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        fastfetch
        helix
        git
        nixos-rebuild-ng
        iputils
        iproute2
        nh
      ];
    };
}
