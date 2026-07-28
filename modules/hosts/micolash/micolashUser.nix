{self, ...}: {
  flake.modules.hosts.micolash.user = {
    users.users."${self.userWillowispll.username}" = {
      description = "${self.userWillowispll.username}";
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };
}
