{ inputs, ... }: {
  flake.nixosModules.finixProgramsPipewire = {
    imports = [ inputs.finix-community-modules.nixosModules.pipewire ];
    programs.pipewire.enable = true;
  };
}
