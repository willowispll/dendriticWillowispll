{ inputs, ... }: {
  flake.modules.finix.programs.amnezia = {
    imports = [ inputs.finix-community-modules.nixosModules.amnezia-vpn ];
    programs.amnezia-vpn.enable = true;
  };
}
