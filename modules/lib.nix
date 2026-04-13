{
  lib,
  self,
  inputs,
  ...
}:
{
  options.flake.lib = lib.mkOption {
    type = lib.types.attrsOf lib.types.unspecified;
    default = { };
  };

  config.flake.lib = {
    hm = modules: {
      home-manager.users.${self.variables.username}.imports = modules;
    };

    mkSystem =
      {
        nixosModules,
        homeModules ? [ ],
        configuration ? { },
      }:
      let
        nixosWithDefault = nixosModules ++ [ self.nixosModules.default ];
        homeWithDefault = homeModules ++ [ self.homeModules.default ];
      in
      inputs.nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = nixosWithDefault ++ lib.optional (homeWithDefault != [ ]) (self.lib.hm homeWithDefault);
      }
      // configuration;
  };
}
