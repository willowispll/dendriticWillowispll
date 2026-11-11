{ inputs, ... }: {
  flake.hosts.ebrietas.programs.bash = {
    imports = [ inputs.finix.nixosModules.bash ];
    programs.bash.enable = true;
  };
}
