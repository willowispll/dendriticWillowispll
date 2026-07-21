{lib, ...}: {
  flake.options.userWillowispll = lib.mkOption {
    readOnly = true;
    type = lib.types.attrsOf lib.types.unspecified;
    default = {
      username = "willowispll";
      homedir = "/home/willowispll";
      locale = "en_US.UTF-8";
      timezone = "Europe/Moscow";
      stateVersion = "25.05";
      backupFileExtension = "backup";
    };
  };
}
