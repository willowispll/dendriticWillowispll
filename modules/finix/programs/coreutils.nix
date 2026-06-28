{
  flake.nixosModules.finixProgramsCoreutils = { pkgs, ... }: {
    programs.coreutils.package = pkgs.uutils-coreutils;
  };
}
