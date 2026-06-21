{
  flake.nixosModules.ebrietasUser = { config, ... }: {
    users.users.willowispll = {
      isNormalUser = true;
      description = "willowispll's user configuration";
      extraGroups = [
        "wheel"
        "video"
        "audio"
        "input"
        "plugdev"
        "dialout"
        config.services.seatd.group
      ];
      password = "$6$zjIM/S19XP5fI5Yl$kMieQUOuAXHTYi/z/LAiIFf/YPqRAaEGhqi.oB1Y/s1ANJlKJmizjbk4wMMveKewMvMMftVI6mE/1pLxRxsK10";
    };
  };
}
