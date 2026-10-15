{ inputs, ... }: {
  flake.hosts.shared.programs.pipewire = {
    imports = [ inputs.finix-community-modules.nixosModules.pipewire ];
    programs.pipewire.enable = true;
  };
}
