{
  flake.modules.finix.environment.default = { lib, ... }:
  {
    options = {
      environment.variables = lib.mkOption {
        default = { };
        type = with lib.types; attrsOf (
          nullOr (oneOf [
          (listOf (oneOf [
            int
            str
            path
          ]))
          int
          str
          path
          ])
        );

        apply =
          let
            toStr = v: if lib.isPath v then "${v}" else toString v;
          in
          attrs:
          lib.mapAttrs (n: v: if lib.isList v then lib.concatMapStringsSep ":" toStr v else toStr v) (
            lib.filterAttrs (n: v: v != null) attrs
          );
      };
    };
  };
}
