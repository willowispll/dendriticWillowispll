{ inputs, ... }: {
  flake.modules.finix.programs.pipewire = {
    imports = [ inputs.finix-community-modules.nixosModules.pipewire ];
    programs.pipewire.enable = true;
  };
}
