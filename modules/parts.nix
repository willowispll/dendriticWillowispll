{inputs, ...}: {
  #options.flake.homeModules = lib.mkOption {
  # type = lib.types.lazyAttrsOf lib.types.raw;
  # default = { };
  #};
  imports = [inputs.home-manager.flakeModules.home-manager];
  config.systems = [
    "x86_64-linux"
    "aarch64-linux"
  ];
}
