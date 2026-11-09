{ inputs, ... }: {
  flake.hosts.shared.programs.wireplumber = {
    imports = [ inputs.finix.nixosModules.wireplumber ];
    programs.wireplumber.enable = true;
  };
}
