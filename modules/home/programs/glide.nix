{inputs, ...}: {
  flake.homeModules.glide = {
    imports = [inputs.glide.homeModules.default];
    programs.glide-browser.enable = true;
  };
}
