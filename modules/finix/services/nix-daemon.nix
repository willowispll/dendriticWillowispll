{inputs, ...}: {
  flake.modules.finix.services.nix-daemon = {
    imports = [inputs.finix.nixosModules.nix-daemon];
    services.nix-daemon = {
      enable = true;
      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        trusted-users = [
          "root"
          "@wheel"
        ];
      };
    };
  };
}
