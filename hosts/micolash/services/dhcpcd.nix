{ inputs, ... }: {
  flake.hosts.micolash.services.dhcpcd = {
    imports = [ inputs.finix.nixosModules.dhcpcd ];
    services.dhcpcd.enable = true;
  };
}
