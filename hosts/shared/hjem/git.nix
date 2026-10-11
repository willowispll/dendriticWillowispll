{
  flake.hjemModules.git = {lib, ...}: {
    xdg.config.files."git/config" = {
      generator = lib.generators.toINI {};
      value = {
        core = {
          fileMode = false;
        };
        user = {
          name = "willowispll";
          email = "gorelikgleb+github@gmail.com";
        };
      };
    };
  };
}
