{ pkgs, inputs,  ...}:{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = false;
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs;};
    users.willowispll = {
      home.username = "willowispll";
      home.homeDirectory = "/home/willowispll";
      home.stateVersion = "25.05";

      imports = [
        ./kitty.nix
        ./helix.nix
        
        {
          programs.bash.enable = true;
          fonts.fontconfig.enable = true;
          xdg.dataFile = {
            "v2rayN/bin/sing_box/sing-box".source = "${pkgs.sing-box}/bin/sing-box";
          };
        }
      ];
    };
  }; 
}

