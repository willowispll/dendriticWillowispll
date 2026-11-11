{ inputs, ... }: {
  flake.hosts.ebrietas.services.sysklogd = {
    imports = [ inputs.finix.nixosModules.sysklogd ];
    services.sysklogd.enable = true;
  };
}
