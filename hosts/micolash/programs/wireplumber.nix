{ inputs, ... }: {
  flake.hosts.micolash.programs.wireplumber = {
    imports = [ inputs.finix.nixosModules.wireplumber ];
    programs.wireplumber.enable = true;
  };
}
