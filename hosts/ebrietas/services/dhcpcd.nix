{ inputs, ... }: {
  flake.hosts.ebrietas.services.dhcpcd = {
    imports = [ inputs.finix.nixosModules.dhcpcd ];
    services.dhcpcd.enable = true;
  };
}
