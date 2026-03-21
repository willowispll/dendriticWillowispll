{
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit inputs;};
    users.willowispll = {
      home.username = "willowispll";
      home.homeDirectory = "/home/willowispll";
      home.stateVersion = "25.05";

      imports =
        lib.filesystem.listFilesRecursive ./homePkgs ++ lib.filesystem.listFilesRecursive ./niri/utils;
    };
  };
}
