{inputs, ...}: {
  flake.modules.finix.programs.gnome-keyring = {
    imports = [inputs.finix.nixosModules.gnome-keyring];
    programs.gnome-keyring.enable = true;
  };
}
