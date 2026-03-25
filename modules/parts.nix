{lib, ...}: {
  options.flake.homeModules = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.raw;
    default = {};
  };

  config.systems = [
    "x86_64-linux"
    "aarch64-linux"
  ];
}
