{ inputs, ... }:
{
  flake.homeModules.nixcord = {
    imports = [ inputs.nixcord.homeModules.nixcord ];

    programs.nixcord = {
      enable = true;
      discord = {
        enable = true;
        openASAR.enable = false;
        vencord.enable = true;
      };
      vesktop.enable = false;

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
