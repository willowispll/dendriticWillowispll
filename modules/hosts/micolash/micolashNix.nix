{
  flake.nixosModules.micolashNix = {
    nix = {
      settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      extraOptions = "warn-dirty = false";
    };
  };
}
