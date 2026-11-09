{
  flake.hosts.micolash.features.environment = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      foot
      fuzzel
      handlr-regex
      concord-tui
      ncpamixer
      gram
      wbg

      nh
      nil
      btop
      nix-tree
      nerdfetch
      gitMinimal
    ];
  };
}
