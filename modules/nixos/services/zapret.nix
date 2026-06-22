{ inputs, ... }:
{
  flake.nixosModules.nixosServicesZapret = {
    imports = [ inputs.zapret.nixosModules.default ];
    services.zapret-discord-youtube = {
      enable = true;
      configName = "general(ALT11)";
    };
  };
}
