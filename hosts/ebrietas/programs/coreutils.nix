{
  flake.hosts.ebrietas.programs.coreutils = { pkgs, ... }: {
    programs.coreutils.package = pkgs.busybox;
  };
}
