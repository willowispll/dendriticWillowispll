{ inputs, ... }: {
  flake.nixosModules.finixProfilesMinimal = {
    imports = [ inputs.finix-community-modules.nixosModules.minimal ];

    profiles.minimal = {
      enable = true;
      deviceManager = "keventd";
      withFlakes = true;
    };
  };
}
