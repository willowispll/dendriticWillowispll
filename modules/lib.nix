{
  lib,
  self,
  inputs,
  ...
}: {
  options.flake = {
    homeModules = lib.mkOption {
      type = with lib.types; lazyAttrsOf deferredModule;
      default = {};
    };
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
    hmWrapper = modules: {
      home-manager.users.${self.userWillowispll.username}.imports = modules;
    };
    hjemWrapper = modules: {
      hjem.users.${self.userWillowispll.username}.imports = modules;
    };

    mkSystem = {
      modules,
      homeModules ? [],
      hjemModules ? [],
      configuration ? {},
      finix ? false,
    }: let
      baseModules =
        modules
        ++ lib.optional (homeModules != []) (self.lib.hmWrapper homeModules)
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
