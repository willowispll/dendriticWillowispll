{ inputs, ... }: {
  flake.nixosModules.finixServicesLy = { lib, ... }: {
    imports = [ inputs.finix.nixosModules.ly ];
    services.ly = {
      enable = true;
      settings = {
        x_cmd = lib.mkForce "/run/wrappers/bin/X";
      };
    };
  };
}
