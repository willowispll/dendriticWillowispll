{pkgs, ...}: let
  zed-rpc = pkgs.buildEnv {
    name = "zed-editor";
    paths = [
      pkgs.zed-editor
      pkgs.zed-discord-presence
    ];
  };
in {
  programs.zed-editor = {
    enable = true;
    package = zed-rpc;
    extensions = [
      "nix"
      "toml"
    ];
  };
}
