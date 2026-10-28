{ inputs, ... }: {
  flake.hosts.shared.programs.amnezia-vpn = {
    imports = [ inputs.finix-community-modules.nixosModules.amnezia-vpn ];
    programs.amnezia-vpn.enable = true;
  };
}
