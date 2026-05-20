{
  flake.nixosModules.zapret = {
    { inputs, ... }:{
    imports = [ inputs.zapret.nixosModules.default ];
      services.zapret-discord-youtube = {
        enable = true;
        config = "general(ALT11)";
      };
    };
  };
}
