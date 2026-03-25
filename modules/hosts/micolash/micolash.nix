{ self, inputs, ... }: {
  flake.nixosConfigurations.micolash = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    modules = [
      self.nixosModules.micolashHardware
      self.nixosModules.micolashConfiguration
      self.nixosModules.services
      self.nixosModules.gaming
      self.nixosModules.packages
      self.nixosModules.spicetify
      self.nixosModules.niri
      self.nixosModules.lanzaboote
      self.nixosModules.homeManager
    ];
  };
}
