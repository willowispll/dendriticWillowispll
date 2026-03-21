{inputs, ...}: {
  imports = [inputs.glide.homeModules.default];
  programs.glide-browser.enable = true;
}
