{
  lib,
  self,
  inputs,
  ...
}: {
  options.flake = {
    hjemModules = lib.mkOption {
      type = with lib.types; lazyAttrsOf deferredModule;
      default = {};
    };
    modules = lib.mkOption {
      type = with lib.types; lazyAttrsOf (lazyAttrsOf (lazyAttrsOf deferredModule));
      default = {};
    };
    lib = lib.mkOption {
      type = lib.types.attrsOf lib.types.raw;
      default = {};
    };
  };

  config.flake.lib = {
    hjemWrapper = modules: {
      hjem.users.${self.userWillowispll.username}.imports = modules;
    };

    mkSystem = {
      modules,
      hjemModules ? [],
      configuration ? {},
      finix,
    }: let
      baseModules =
        modules
        ++ lib.optional (hjemModules != []) (self.lib.hjemWrapper hjemModules);
      specialArgs = {inherit inputs;};
    in
      (
        if finix
        then
          inputs.finix.lib.finixSystem {
            inherit (inputs.nixpkgs) lib;
            inherit specialArgs;
            modules = baseModules;
          }
        else
          inputs.nixpkgs.lib.nixosSystem {
            inherit specialArgs;
            modules = baseModules;
          }
      )
      // configuration;
  };
}
