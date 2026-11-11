{
  flake.overlays.without-systemd = final: prev: {
    at-spi2-core = prev.at-spi2-core.override {
      systemdSupport = false;
    };

    cups = prev.cups.override {
      enableSystemd = false;
    };

    dbus = prev.dbus.override {
      enableSystemd = false;
    };

    iwd = (prev.iwd.override { }).overrideAttrs (oldAttrs: {
      doCheck = false;
    });

    libajantv2 = prev.libajantv2.override {
      udev = final.libudev-zero;
    };

    libcamera = prev.libcamera.override {
      udev = final.libudev-zero;
    };

    libcanberra = prev.libcanberra.override {
      withSystemd = false;
    };

    libfido2 = prev.libfido2.override {
      udev = final.libudev-zero;
    };

    libsecret = (prev.libsecret.override { }).overrideAttrs (oldAttrs: {
      doCheck = false;
    });

    libusb1 = prev.libusb1.override {
      udev = final.libudev-zero;
    };

    linux-pam = prev.linux-pam.override {
      withLogind = false;
    };

    openvpn = prev.openvpn.override {
      useSystemd = false;
    };

    pipewire =
      (prev.pipewire.override {
        enableSystemd = false;
        udev = final.libudev-zero;
      }).overrideAttrs
        (oldAttrs: {
          buildInputs = builtins.filter (p: p != prev.elogind) (oldAttrs.buildInputs or [ ]);
          mesonFlags = (oldAttrs.mesonFlags or [ ]) ++ [
            "-Dlogind=disabled"
          ];
        });

    polkit = prev.polkit.override {
      useConsoleKit = true;
      useSystemd = false;
      doCheck = false;
    };

    procps = prev.procps.override {
      withSystemd = false;
    };

    qt6 = prev.qt6.overrideScope (
      qtFinal: qtPrev: {
        qtbase = qtPrev.qtbase.override {
          systemdSupport = false;
          udev = final.libudev-zero;
        };
      }
    );

    sdl3 = prev.sdl3.override {
      libudevSupport = false;
    };

    seatd = prev.seatd.override {
      systemdSupport = false;
    };

    util-linux = prev.util-linux.override {
      systemdSupport = false;
    };

    v4l-utils = prev.v4l-utils.override {
      udev = final.libudev-zero;
    };

    wireplumber = (prev.wireplumber.override { }).overrideAttrs (oldAttrs: {
      postPatch = (oldAttrs.postPatch or "") + ''
        substituteInPlace po/meson.build \
          --replace-fail \
            "python_po = pymod.find_installation('python3')" \
            "python_po = pymod.find_installation('python3', required: false)"
      '';

      buildInputs = builtins.filter (p: p != prev.systemdLibs) (oldAttrs.buildInputs or [ ]);
      mesonFlags = (oldAttrs.mesonFlags or [ ]) ++ [
        "-Dsystemd-system-service=false"
        "-Dsystemd=disabled"
      ];
    });

    xdg-desktop-portal =
      (prev.xdg-desktop-portal.override {
        enableSystemd = false;
      }).overrideAttrs
        (oldAttrs: {
          doCheck = false;
        });
  };
}
