{ inputs, ... }: {
  flake.hosts.micolash.programs.niri = {
    imports = [ inputs.finix.nixosModules.niri ];
    programs.niri.enable = true;
  };
}
