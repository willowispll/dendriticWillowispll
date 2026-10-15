{ inputs, ... }: {
  flake.hosts.shared.programs.sudo = {
    imports = [ inputs.finix.nixosModules.sudo ];
    programs.sudo.enable = true;
  };
}
