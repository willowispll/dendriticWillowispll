{
  flake.overlays.without-x11 = final: prev: {
    at-spi2-core = prev.at-spi2-core.overrideAttrs (oldAttrs: {
      mesonFlags =
        builtins.filter (flag: !(builtins.match "-Dx11=.*" flag != null)) oldAttrs.mesonFlags
        ++ [ "-Dx11=disabled" ];

      buildInputs = builtins.filter (
        input:
        !builtins.elem input [
          prev.libX11
          prev.libXtst
          prev.libXi
          prev.libXext
        ]
      ) oldAttrs.buildInputs;
    });

    cairo = prev.cairo.override {
      x11Support = false;
    };

    concord-tui =
      (prev.concord-tui.override {
        libva = prev.libva.override {
          minimal = true;
        };
      }).overrideAttrs
        (oldAttrs: {
          doCheck = false;
        });

    dbus = prev.dbus.override {
      x11Support = false;
    };

    gjs = prev.gjs.overrideAttrs (old: {
      doCheck = false;
      nativeCheckInputs = [ ];
    });

    gram = (prev.gram.override { }).overrideAttrs (oldAttrs: {
      doCheck = false;

      postPatch = (oldAttrs.postPatch or "") + ''
        substituteInPlace Cargo.toml \
          --replace-fail \
            'xkbcommon = { version = "0.8.0", features = ["wayland", "x11"] }' \
            'xkbcommon = { version = "0.8.0", features = ["wayland"] }'

        substituteInPlace crates/gram/Cargo.toml \
          --replace-fail \
            'gpui = { workspace = true, features = ["cosmic-text", "wayland", "windows-manifest", "x11"] }' \
            'gpui = { workspace = true, features = ["cosmic-text", "wayland", "windows-manifest"] }'
      '';
    });

    gst_all_1 = prev.gst_all_1.overrideScope (
      gstFinal: gstPrev: {
        gst-plugins-base =
          (gstPrev.gst-plugins-base.override {
            enableX11 = false;
          }).overrideAttrs
            (oldAttrs: {
              mesonFlags = (oldAttrs.mesonFlags or [ ]) ++ [
                "-Dgl_winsys=wayland,egl,surfaceless"
              ];
            });

        gst-plugins-bad = gstPrev.gst-plugins-bad.overrideAttrs (oldAttrs: {
          mesonFlags =
            builtins.filter (flag: !(builtins.match "-Dx11=.*" flag != null)) (oldAttrs.mesonFlags or [ ])
            ++ [
              "-Dx11=disabled"
            ];
        });
      }
    );

    gtk3 = prev.gtk3.override {
      x11Support = false;
      xineramaSupport = false;
    };

    gtk4 = prev.gtk4.override {
      x11Support = false;
      xineramaSupport = false;
    };

    jasper = prev.jasper.override {
      enableOpenGL = false;
    };

    libepoxy =
      (prev.libepoxy.override {
        x11Support = false;
      }).overrideAttrs
        (oldAttrs: {
          buildInputs = (oldAttrs.buildInputs or [ ]) ++ [
            final.libglvnd.dev
          ];

          mesonFlags =
            builtins.filter (
              flag:
              !(builtins.match "-Degl=.*" flag != null)
              && !(builtins.match "-Dglx=.*" flag != null)
              && !(builtins.match "-Dx11=.*" flag != null)
            ) oldAttrs.mesonFlags
            ++ [
              "-Degl=yes"
              "-Dglx=no"
              "-Dx11=false"
            ];
        });

    libglvnd =
      (prev.libglvnd.override {
        libx11 = null;
        libxext = null;
        xorgproto = null;
      }).overrideAttrs
        (oldAttrs: {
          configureFlags = (oldAttrs.configureFlags or [ ]) ++ [
            "--disable-x11"
          ];

          buildInputs = builtins.filter (
            p:
            !(builtins.elem p [
              prev.libX11
              prev.libXext
              prev.xorgproto
            ])
          ) (oldAttrs.buildInputs or [ ]);
        });

    libgudev =
      (prev.libgudev.override {
        udev = final.libudev-zero;
      }).overrideAttrs
        (oldAttrs: {
          doCheck = false;
          mesonFlags = (oldAttrs.mesonFlags or [ ]) ++ [
            "-Dtests=disabled"
          ];
        });

    libxkbcommon = (prev.libxkbcommon.override { }).overrideAttrs (oldAttrs: {
      mesonFlags =
        builtins.filter (
          flag:
          !(builtins.match "-Denable-x11=.*" flag != null)
          && !(builtins.match "-Dx-locale-root=.*" flag != null)
        ) (oldAttrs.mesonFlags or [ ])
        ++ [
          "-Denable-x11=false"
          "-Dx-locale-root=/nonexistent"
        ];

      buildInputs = builtins.filter (p: p != prev.libxcb) (oldAttrs.buildInputs or [ ]);
      nativeBuildInputs = builtins.filter (p: p != prev.xvfb) (oldAttrs.nativeBuildInputs or [ ]);

      doCheck = false;
    });

    ly = prev.ly.override {
      x11Support = false;
    };

    mesa =
      (prev.mesa.override {
        udev = final.libudev-zero;

        eglPlatforms = [ "wayland" ];

        libx11 = null;
        libxcb = null;
        libxcb-keysyms = null;
        libxext = null;
        libxfixes = null;
        libxrandr = null;
        libxshmfence = null;
        libxxf86vm = null;
        xorgproto = null;
      }).overrideAttrs
        (oldAttrs: {
          mesonFlags = (oldAttrs.mesonFlags or [ ]) ++ [
            "-Dxlib-lease=disabled"
            "-Dglx=disabled"
          ];
        });

    pango = prev.pango.override {
      x11Support = false;
    };

    pipewire = prev.pipewire.override {
      x11Support = false;
    };

    qt6 = prev.qt6.overrideScope (
      qtFinal: qtPrev: {
        qtbase = qtPrev.qtbase.overrideAttrs (oldAttrs: {
          cmakeFlags =
            builtins.filter (flag: !(builtins.match "-DQT_FEATURE_xcb=.*" flag != null)) (
              oldAttrs.cmakeFlags or [ ]
            )
            ++ [ "-DQT_FEATURE_xcb=OFF" ];

          propagatedBuildInputs = builtins.filter (
            p:
            !(builtins.elem p [
              prev.libX11
              prev.libXcomposite
              prev.libXext
              prev.libXi
              prev.libXrender
              prev.libxcb
              prev.libxcb-util
              prev.libxcb-image
              prev.libxcb-keysyms
              prev.libxcb-render-util
              prev.libxcb-wm
              prev.libxcb-cursor
              prev.libXdmcp
              prev.libXtst
            ])
          ) (oldAttrs.propagatedBuildInputs or [ ]);
        });
      }
    );

    sdl3 = prev.sdl3.override {
      x11Support = false;
    };
  };
}
