{
  flake.modules.hosts.micolash.nix = {
    nix = {
      settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      extraOptions = "warn-dirty = false";
    };
  };
}
