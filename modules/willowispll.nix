{self, ...}: {
  flake.nixosModules.willowispll = {
    home-manager.users."${self.variables.username}".home = {
      username = "${self.variables.username}";
      homeDirectory = "${self.variables.homedir}";
    };

    users.users."${self.variables.username}" = {
      description = "${self.variables.username}";
      isNormalUser = true;
      initialPassword = "password";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };

  flake.homeModules.willowispll = {
    home.stateVersion = "${self.variables.stateVersion}";
  };
}
