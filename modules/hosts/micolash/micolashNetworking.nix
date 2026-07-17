{
  flake.nixosModules.micolashNetworking = {
    networking = {
      hostName = "micolash";
      networkmanager.enable = true;
      firewall.enable = true;
    };
  };
}
