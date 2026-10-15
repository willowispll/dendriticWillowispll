{ inputs, ... }: {
  flake.hosts.shared.services.sysklogd = {
    imports = [ inputs.finix.nixosModules.sysklogd ];
    services.sysklogd.enable = true;
  };
}
