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

  config.flake = {
    nixosModules.default = { };
    homeModules.default = { };
  };

  config.flake.lib = {
    hm = modules: {
      home-manager.users.${self.userWillowispll.username}.imports = modules;
    };

    mkSystem =
      {
        modules,
        homeModules ? [ ],
        configuration ? { },
        finix ? false,
      }:
      let
        homeManaged = homeModules != [ ];
        homeModulesExpr = lib.optional homeManaged (self.lib.hm homeModules);
      in
      if finix then
        inputs.finix.lib.finixSystem {
          inherit (inputs.nixpkgs) lib;
          specialArgs = { inherit inputs; };
          modules = modules ++ homeModulesExpr;
        }
        // configuration
      else
        inputs.nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = modules ++ [ self.nixosModules.default ] ++ homeModulesExpr;
        }
        // configuration;
  };
}
