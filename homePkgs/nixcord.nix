{ inputs, ... }:{
  imports = [ inputs.nixcord.homeModules.nixcord ];

  programs.nixcord = {
    enable = true;
    discord.vencord.enable = true;
    config = {
      themeLinks = [
        "https://raw.githubusercontent.com/catppuccin/discord/refs/heads/main/themes/mocha.theme.css"
      ];
      plugins = {
        crashHandler.enable = true;
        fakeNitro.enable = true;
        showHiddenChannels.enable = true;
        showHiddenThings.enable = true;
        CustomRPC = {
          enable = true;
          config = {
            type =  3;
            timestampMode = 1;
            appID = "1107968030350262292";
            appName = "Yuzuha";
            imageBig = "";
            details = "i used to think";
            detailsURL = "";
            state = "whats the purpose of life?";
            buttonOneText = "thighs";
            buttonTwoText = "";
            buttonOneURL = "https://i.imgur.com/UtmFmDT.jpeg";
          };
        };
      };
    };
  };
}
