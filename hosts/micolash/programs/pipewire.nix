{ inputs, ... }: {
  flake.hosts.micolash.programs.pipewire = {
    imports = [ inputs.finix.nixosModules.pipewire ];
    programs.pipewire.enable = true;
  };
}
