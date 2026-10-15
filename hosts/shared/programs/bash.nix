{ inputs, ... }: {
  flake.hosts.shared.programs.bash = {
    imports = [ inputs.finix.nixosModules.bash ];
    programs.bash.enable = true;
  };
}
