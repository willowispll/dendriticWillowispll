{ inputs, ... }: {
  flake.hosts.shared.programs.pipewire = {
    imports = [ inputs.finix.nixosModules.pipewire ];
    programs.pipewire.enable = true;
  };
}
