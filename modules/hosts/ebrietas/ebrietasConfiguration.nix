{ inputs, ... }:
{
  flake.nixosModules.ebrietasConfiguration =
    { pkgs, ... }:
    {
      imports = [ inputs.finix-community-modules.nixosModules.minimal ];

      profiles.minimal = {
        enable = true;
        deviceManager = "keventd";
        withFlakes = true;
      };

      programs = {
        nano.enable = true;
        sudo.enable = true;
      };

      services.seatd.enable = true;
      services.iwd.enable = true;
      services.dbus.enable = true;

      networking.hostName = "ebrietas";

      time.timeZone = "Europe/Moscow";

      environment.systemPackages = with pkgs; [
        fastfetch
        helix
        git
        nixos-rebuild-ng
        iputils
        iproute2
        nh
      ];
    };
}
