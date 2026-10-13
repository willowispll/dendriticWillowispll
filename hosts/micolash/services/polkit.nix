{ inputs, ... }: {
  flake.hosts.micolash.services.polkit = {
    imports = [ inputs.finix.nixosModules.polkit ];
    services.polkit.enable = true;
  };
}
