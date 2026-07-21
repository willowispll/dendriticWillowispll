{inputs, ...}: {
  flake.modules.finix.profiles.minimal = {
    imports = [inputs.finix-community-modules.nixosModules.minimal];

    profiles.minimal = {
      enable = true;
      deviceManager = "keventd";
      withFlakes = true;
    };
  };
}
