{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.micolashHome = {
    imports = [inputs.home-manager.nixosModules.home-manager];
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
      extraSpecialArgs = {inherit inputs;};
      users.willowispll = {
        home.username = "willowispll";
        home.homeDirectory = "/home/willowispll";
        home.stateVersion = "25.05";
        imports = [
          # apps
          self.homeModules.stylix
          self.homeModules.helix
          self.homeModules.kitty
          self.homeModules.nixcord
          self.homeModules.obs
          self.homeModules.obsidian
          self.homeModules.glide
          self.homeModules.foliate
          self.homeModules.zed
          self.homeModules.spicetify
          # utils
          self.homeModules.bash
          self.homeModules.fastfetch
          self.homeModules.fontconfig
          self.homeModules.git
          self.homeModules.nh
          self.homeModules.xdg
          self.homeModules.lla
          # wm
          self.homeModules.waybar
          self.homeModules.fuzzel
          self.homeModules.mako
        ];
      };
    };
  };
}
