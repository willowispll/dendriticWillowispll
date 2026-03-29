{
  flake.nixosModules.tlp = {
    services.tlp = {
      enable = true;
      settings = {
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        PLATFORM_PROFILE_ON_BAT = "low-power";
      };
    };
  };
}
