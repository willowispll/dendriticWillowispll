{self, ...}: {
  flake.modules.hosts.ebrietas.user = {
    users.users."${self.userWillowispll.username}" = {
      description = "${self.userWillowispll.username}";
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "video"
        "audio"
        "input"
        "plugdev"
        "dialout"
        "seat"
      ];
    };
  };
}
