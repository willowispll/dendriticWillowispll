{
  flake.homeModules.onlyoffice = {
    programs.onlyoffice = {
      enable = true;
      settings = {
        theme = "theme-modern-light";
      };
    };
  };
}
