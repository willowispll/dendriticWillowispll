{
  flake.nixosModules.ebrietasConfiguration =
    { config, pkgs, ... }:
    {
      finit.runlevel = 3;

      finit.services.nix-daemon = {
        environment.CURL_CA_BUNDLE = config.security.pki.caBundle;
      };

      services.nix-daemon = {
        enable = true;
        settings = {
          experimental-features = [
            "nix-command"
            "flakes"
          ];
          trusted-users = [
            "root"
            "@wheel"
          ];
        };
      };

      programs = {
        sudo.enable = true;
        bash.enable = true;
        nano.enable = true;
      };

      services = {
        polkit.enable = true;
        sysklogd.enable = true;
        dbus.enable = true;
        udev.enable = true;
        dhcpcd.enable = true;
        seatd.enable = true;
        iwd.enable = true;
      };

      networking.hostName = "ebrietas";

      # Set your time zone.
      time.timeZone = "Europe/Moscow";

      # Define a user account. Don't forget to set a password with ‘passwd’.
      users.users.willowispll = {
        isNormalUser = true;
        description = "willowispll user";
        extraGroups = [
          "wheel"
          "video"
          "audio"
          "input"
          "plugdev"
          "dialout"
          config.services.seatd.group
        ];
        password = "$6$zjIM/S19XP5fI5Yl$kMieQUOuAXHTYi/z/LAiIFf/YPqRAaEGhqi.oB1Y/s1ANJlKJmizjbk4wMMveKewMvMMftVI6mE/1pLxRxsK10";
      };

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
