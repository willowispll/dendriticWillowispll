{ inputs, ... }: {
  flake.hosts.micolash.services.sysklogd = {
    imports = [ inputs.finix.nixosModules.sysklogd ];
    services.sysklogd.enable = true;
  };
}
