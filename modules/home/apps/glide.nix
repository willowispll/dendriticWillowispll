{
  flake.homeModules.glide = {inputs, ...}: {
    imports = [inputs.glide.homeModules.default];
    programs.glide-browser.enable = true;
  };
}
