{
  flake.hosts.micolash.programs.coreutils = { pkgs, ... }: {
    programs.coreutils.package = pkgs.busybox;
  };
}
