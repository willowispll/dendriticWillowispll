{
  flake.homeModules.nixcord =
    { inputs, ... }:
    {
      imports = [ inputs.nixcord.homeModules.nixcord ];

      programs.nixcord = {
        enable = true;
        discord.enable = false;
        vesktop.enable = true;
        config = {
          themeLinks = [
            "https://raw.githubusercontent.com/catppuccin/discord/refs/heads/main/themes/mocha.theme.css"
          ];
          disableMinSize = true;
          plugins = {
            crashHandler.enable = true;
            fakeNitro.enable = true;
            showHiddenChannels.enable = true;
            showHiddenThings.enable = true;
          };
        };
      };
    };
}
