{ inputs, ... }: {
  flake.hosts.micolash.programs.limine = {
    imports = [ inputs.finix.nixosModules.limine ];
    programs.limine = {
      enable = true;
      settings.wallpaper = [ ];
    };
  };
}
