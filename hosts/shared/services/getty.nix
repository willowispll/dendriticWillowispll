{ inputs, ... }: {
  flake.hosts.shared.services.getty = {
    imports = [ inputs.finix.nixosModules.getty ];
    services.getty = {
      enable = true;

      ttys = [
        "tty1"
        "tty2"
      ];
    };
  };
}
