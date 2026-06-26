{ inputs, ... }: {
  flake.nixosModules.finixProgramsFastfetch = {
    imports = [ inputs.finix-community-modules.nixosModules.fastfetch ];
    programs.fastfetch.enable = true;
  };
}
