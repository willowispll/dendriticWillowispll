{ inputs, ... }: {
  flake.hosts.ebrietas.programs.pipewire = {
    imports = [ inputs.finix.nixosModules.pipewire ];
    programs.pipewire.enable = true;
  };
}
