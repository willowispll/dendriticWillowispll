{
  flake.hosts.ebrietas.features.finit = {pkgs, ...}: {
    finit = {
      runlevel = 3;
      package = pkgs.finit.override {udevSupport = true;};
      cgroups.system.settings = {
        "cpu.weight" = 100;
      };
    };
  };
}
