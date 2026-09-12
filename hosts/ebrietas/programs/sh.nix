{
  flake.hosts.ebrietas.programs.sh = {pkgs, ...}: {
    programs.sh.package = pkgs.busybox;
  };
}
