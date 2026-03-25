{
  flake.nixosModules.lanzaboote = { pkgs, lib, ... }: let
    sources = import ./_lon.nix;
    lanzaboote = import sources.lanzaboote;
  in {
    imports = [ lanzaboote.nixosModules.lanzaboote ];

    environment.systemPackages = [
      pkgs.sbctl
      pkgs.lon
    ];

    boot.loader.systemd-boot.enable = lib.mkForce false;

    boot.lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };
  };
}
