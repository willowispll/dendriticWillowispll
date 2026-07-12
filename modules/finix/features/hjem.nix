{ self, inputs, ... }: {
  flake.modules.finix.features.hjem = {
    imports = [ inputs.hjem.finixModules.default ];
    hjem.users.willowispll = {
      user = self.userWillowispll.username;
      directory = self.userWillowispll.homedir;
      clobberFiles = true;
    };
  };
}
