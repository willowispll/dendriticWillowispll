{
  flake.modules.finix.programs.coreutils = {pkgs, ...}: {
    programs.coreutils.package = pkgs.busybox;
  };
}
