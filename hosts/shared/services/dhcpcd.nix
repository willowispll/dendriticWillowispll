{ inputs, ... }: {
  flake.hosts.shared.services.dhcpcd = {
    imports = [ inputs.finix.nixosModules.dhcpcd ];
    services.dhcpcd = {
      enable = true;
      settings = {
        static = "domain_name_servers=8.8.8.8 1.1.1.1";
      };
    };
  };
}
