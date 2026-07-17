{ self, inputs, ... }: {
  flake.modules.finix.features.homeManager = {
    imports = [ inputs.finix-community-modules.nixosModules.home-manager ];
    home-manager.users.${self.userWillowispll.username}.home = {
      username = self.userWillowispll.username;
      homeDirectory = self.userWillowispll.homedir;
      stateVersion = self.userWillowispll.stateVersion;
    };
  };
}
