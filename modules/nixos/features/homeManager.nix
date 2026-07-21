{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.features.homeManager = {
    imports = [inputs.home-manager.nixosModules.home-manager];
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = self.userWillowispll.backupFileExtension;
      users."${self.userWillowispll.username}".home = {
        username = "${self.userWillowispll.username}";
        homeDirectory = "${self.userWillowispll.homedir}";
        stateVersion = "${self.userWillowispll.stateVersion}";
      };
    };
  };
}
