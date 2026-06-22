{
  flake.nixosModules.ebrietasFinit = { pkgs, ... }: {
    finit = {
      runlevel = 3;

      package = pkgs.finit.overrideAttrs (o: {
        version = "5.0";
        src = pkgs.fetchFromGitHub {
          owner = "finit-project";
          repo = "finit";
          rev = "ad8ed05d64a4e274e39ac2d061fe8c3aa8a87c22";
          sha256 = "sha256-SJTnrcgRx/M07pOQAnm+LeiXSq9YGCON2yHLaKCMyJw=";
        };

        buildInputs = o.buildInputs ++ [ pkgs.util-linuxMinimal.dev ];

        postPatch = (o.postPatch or "") + ''
          substituteInPlace keventd/uevent.c \
            --replace-fail '"/sbin/modprobe", "modprobe"' '"${pkgs.kmod}/bin/modprobe", "modprobe"' \
            --replace-fail '"/usr/lib/firmware/' '"/run/current-system/firmware/lib/firmware/'

          substituteInPlace keventd/builtin.c \
            --replace-fail  '"/lib/udev/hwdb.d"' '"/run/current-system/sw/lib/udev/hwdb.d"' \
            --replace-fail  '"/usr/share/hwdata/usb.ids"' '"${pkgs.hwdata}/share/hwdata/usb.ids"'
        '';
      });
    };
  };
}
