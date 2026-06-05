{ inputs, ... }:
{
  flake.homeModules.nixcord = {
    imports = [ inputs.nixcord.homeModules.nixcord ];

    programs.nixcord = {
      enable = true;
      discord = {
        branch = "canary";
        equicord.enable = true;
        vencord.enable = false;
      };

      config = {
        themeLinks = [
          "https://raw.githubusercontent.com/refact0r/system24/refs/heads/main/theme/flavors/system24-catppuccin-mocha.theme.css"
        ];
        disableMinSize = true;
        plugins = {
          crashHandler.enable = true;
          showHiddenChannels.enable = true;
        };
      };
    };
  };
}
