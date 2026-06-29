{ self, ... }:
{
  flake.nixosModules.userVariables = {
    home-manager.users."${self.userWillowispll.username}".home = {
      username = "${self.userWillowispll.username}";
      homeDirectory = "${self.userWillowispll.homedir}";
    };

    users.users."${self.userWillowispll.username}" = {
      description = "${self.userWillowispll.username}";
      isNormalUser = true;
      initialPassword = "password";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };

  flake.homeModules.userVariables = {
    home.stateVersion = "${self.userWillowispll.stateVersion}";
  };
}
