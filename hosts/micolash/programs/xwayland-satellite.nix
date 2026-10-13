{ inputs, ... }: {
  flake.hosts.micolash.programs.xwayland-satellite = {
    imports = [ inputs.finix.nixosModules.xwayland-satellite ];
    programs.xwayland-satellite.enable = true;
  };
}
