{inputs, ...}: {
  flake.modules.nixos.services.zapret = {
    imports = [inputs.zapret.nixosModules.default];
    services.zapret-discord-youtube = {
      enable = true;
      configName = "general(ALT11)";
    };
  };
}
