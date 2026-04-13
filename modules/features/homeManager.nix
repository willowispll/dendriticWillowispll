{
  self,
  inputs,
  ...
}:
{
  flake.nixosModules.homeManager = {
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = self.variables.backupFileExtension;
      extraSpecialArgs = { inherit inputs; };
    };
  };
}
