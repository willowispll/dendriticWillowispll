{ inputs, ... }: {
  flake.hosts.micolash.programs.bash = {
    imports = [ inputs.finix.nixosModules.bash ];
    programs.bash.enable = true;
  };
}
