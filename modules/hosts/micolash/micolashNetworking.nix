{
  flake.modules.hosts.micolash.networking = {
    networking = {
      hostName = "micolash";
      networkmanager.enable = true;
      firewall.enable = true;
    };
  };
}
