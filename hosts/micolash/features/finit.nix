{
  flake.hosts.micolash.features.finit = {
    finit = {
      runlevel = 3;
      cgroups.system."cpu.weight" = 100;
    };
  };
}
