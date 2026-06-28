{ inputs, ... }: {
  flake.homeModules.zed =
    { pkgs, ... }:
    let
      zed-rpc = pkgs.buildEnv {
        name = "zed-editor";
        paths = [
          inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.zed-editor
          inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.zed-discord-presence
        ];
      };
    in
    {
      programs.zed-editor = {
        enable = true;
        package = zed-rpc;
        extensions = [
          "nix"
          "toml"
        ];
      };
    };
}
