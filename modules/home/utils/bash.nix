{
  flake.homeModules.bash = {
    programs.bash = {
      enable = true;
      initExtra = "fastfetch";
    };
  };
}
