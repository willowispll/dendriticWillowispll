{ inputs, ... }: {
  flake.modules.finix.features.hjem = {
    imports = [ inputs.hjem.finixModules.default ];
    hjem.users.willowispll = {
      user = "willowispll";
      directory = "/home/willowispll";
      clobberFiles = true;
    };
  };
}
