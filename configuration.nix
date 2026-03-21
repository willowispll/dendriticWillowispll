{pkgs, ...}: {
  # Boot
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  # Hardware
  hardware.bluetooth.enable = true;

  # Metworking
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.enable = true;
  };

  # Nix
  nix = {
    settings.experimental-features = ["nix-command" "flakes"];
    extraOptions = ''warn-dirty = false '';
  };

  # Time zone + Locales
  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # User account.
  users.users.willowispll = {
    isNormalUser = true;
    description = "willowispll";
    extraGroups = ["networkmanager" "wheel"];
  };

  # Some Shit
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05";
}
