{ inputs, ... }: {
  flake.hosts.micolash.programs.gnome-keyring = {
    imports = [ inputs.finix.nixosModules.gnome-keyring ];
    programs.gnome-keyring.enable = true;
  };
}
