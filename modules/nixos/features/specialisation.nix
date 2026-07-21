{self, ...}: {
  flake.nixosModules.specialisation = {
    specialisation.finix.toplevel = self.nixosConfigurations.ebrietas.config.system.build.toplevel;
  };
}
