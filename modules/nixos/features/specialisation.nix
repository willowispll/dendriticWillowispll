{self, ...}: {
  flake.modules.nixos.features.specialisation = {
    specialisation.finix.toplevel = self.nixosConfigurations.ebrietas.config.system.build.toplevel;
  };
}
