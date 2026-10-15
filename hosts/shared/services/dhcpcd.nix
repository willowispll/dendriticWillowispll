{ inputs, ... }: {
  flake.hosts.shared.services.dhcpcd = {
    imports = [ inputs.finix.nixosModules.dhcpcd ];
    services.dhcpcd.enable = true;
  };
}
