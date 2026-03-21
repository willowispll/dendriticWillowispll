{inputs, ...}: let
  inherit (inputs.nixpkgs.lib.fileset) toList fileFilter;
  tree = path:
    toList (fileFilter (file:
      if file.type == "directory"
      then true
      else file.hasExt "nix" && !(inputs.nixpkgs.lib.hasPrefix "_" file.name))
    path);
in {
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
        tree ./homePkgs ++ tree ./niri/utils;
    };
  };
}
