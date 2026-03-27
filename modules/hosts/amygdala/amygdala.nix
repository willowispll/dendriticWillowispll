{
  self,
  inputs,
  ...
}:
{
  flake.nixosConfigurations.amygdala = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    modules = [
      self.nixosModules.amygdalaHardware
      self.nixosModules.amygdalaConfiguration
      self.nixosModules.services
      self.nixosModules.packages
      self.nixosModules.niri
      self.nixosModules.homeManager
    ];
  };
}
