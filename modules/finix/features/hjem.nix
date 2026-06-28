{ self, inputs, ... }: {
  flake.nixosModules.finixFeaturesHjem = {
    imports = [ inputs.hjem.finixModules.default ];
    hjem.users.willowispll = {
      user = "willowispll";
      directory = "/home/willowispll";
      clobberFiles = true;
      imports = [
        self.modules.hjem.fastfetch
      ];
    };
  };
}
