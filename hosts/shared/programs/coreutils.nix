{
  flake.hosts.shared.programs.coreutils = { pkgs, ... }: {
    programs.coreutils.package = pkgs.busybox;
  };
}
