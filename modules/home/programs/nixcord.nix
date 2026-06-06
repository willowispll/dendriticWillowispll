{ inputs, ... }:
{
  flake.homeModules.nixcord = {
    imports = [ inputs.nixcord.homeModules.nixcord ];

    programs.nixcord = {
      enable = true;
      discord = {
        enable = false;
        vencord.enable = true;
      };
      vesktop.enable = true;

      config = {
        themeLinks = [
          "https://raw.githubusercontent.com/refact0r/system24/refs/heads/main/theme/flavors/system24-catppuccin-mocha.theme.css"
        ];
        disableMinSize = true;
        plugins = {
          crashHandler.enable = true;
          showHiddenChannels.enable = true;
          webScreenShareFixes.enable = true;
          fakeNitro.enable = true;
        };
      };
    };
  };
}
