{ inputs, ... }:
{
  flake.nixosModules.ebrietasConfiguration =
    { pkgs, ... }:
    {
      imports = [ inputs.finix-community-modules.nixosModules.minimal ];

      profiles.minimal = {
        enable = true;
        deviceManager = "udev";
        withFlakes = true;
      };

      programs = {
        nano.enable = true;
        sudo.enable = true;
        iwd.enable = true;
        polkit.enable = true;
      };

      services.seatd.enable = true;

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
