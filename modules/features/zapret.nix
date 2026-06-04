{ inputs, ... }:
{
  flake.nixosModules.zapret = {
    imports = [ inputs.zapret.nixosModules.default ];
    services.zapret-discord-youtube = {
      enable = false;
      configName = "general(ALT11)";
    };
  };
}
