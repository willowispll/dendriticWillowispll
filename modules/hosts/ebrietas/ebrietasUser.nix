{self, ...}: {
  flake.modules.hosts.ebrietas.user = {
    users.users."${self.userWillowispll.username}" = {
      description = "${self.userWillowispll.username}";
      isNormalUser = true;
      password = "$6$zjIM/S19XP5fI5Yl$kMieQUOuAXHTYi/z/LAiIFf/YPqRAaEGhqi.oB1Y/s1ANJlKJmizjbk4wMMveKewMvMMftVI6mE/1pLxRxsK10";
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
