{ inputs, ... }: {
  flake.nixosModules.finixProgramsAmnezia = {
    imports = [ inputs.finix-community-modules.nixosModules.amnezia-vpn ];
    programs.amnezia-vpn.enable = true;
  };
}
