{ inputs, ... }: {
  flake.nixosModules.finixServicesPolkit = {
    imports = [ inputs.finix.nixosModules.polkit ];
    services.polkit.enable = true;
  };
}
