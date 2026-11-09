final: prev: {
  brave-origin = prev.brave-origin.overrideAttrs (oldAttrs: {
    postInstall = (oldAttrs.postInstall or "") + ''
      rm -rf \
        $out/opt/brave.com/brave-origin/xdg-settings \
        $out/opt/brave.com/brave-origin/xdg-mime
    '';
  });

  foot = prev.foot.overrideAttrs (oldAttrs: {
    postInstall = (oldAttrs.postInstall or "") + ''
      rm -f $out/bin/footclient
      rm -f $out/share/applications/footclient.desktop
      rm -f $out/share/applications/foot-server.desktop
      rm -f $out/lib/systemd/user/foot-server.service
      rm -f $out/lib/systemd/user/foot-server.socket
      rm -rf $out/share/man
    '';
  });

  gst_all_1 = prev.gst_all_1.overrideScope (
    gstFinal: gstPrev: {
      gst-plugins-base = gstPrev.gst-plugins-base.override {
        enableAlsa = false;
        enableDocumentation = false;
      };
    }
  );

  gtk3 = prev.gtk3.override {
    broadwaySupport = false;
    cupsSupport = false;
  };

  libfido2 = prev.libfido2.override {
    withPcsclite = false;
  };

  libpcap = prev.libpcap.override {
    withRdma = false;
  };

  libusb1 = prev.libusb1.override {
    withDocs = false;
  };

  niri =
    (prev.niri.override {
    }).overrideAttrs
      (oldAttrs: {
        doCheck = false;
        doInstallCheck = false;
        checkFlags = [ ];
        nativeInstallCheckInputs = [ ];
      });

  pipewire =
    (prev.pipewire.override {
      bluezSupport = false;
    }).overrideAttrs
      (oldAttrs: {
        doCheck = false;
        buildInputs = builtins.filter (p: p != prev.modemmanager) (oldAttrs.buildInputs or [ ]);
      });

  qt6 = prev.qt6.overrideScope (
    qtFinal: qtPrev: {
      qtbase = qtPrev.qtbase.override {
        qttranslations = null;
      };
    }
  );

  sdl3 = prev.sdl3.override {
    alsaSupport = false;
    ibusSupport = false;
    jackSupport = false;
    pulseaudioSupport = false;
  };

  v4l-utils =
    (prev.v4l-utils.override {
      withUtils = false;
      withGUI = false;
      withBPF = false;
    }).overrideAttrs
      (oldAttrs: {
        doInstallCheck = false;
      });

  wireplumber = prev.wireplumber.override {
    enableDocs = false;
    enableGI = false;
  };

  xdg-utils = final.handlr-regex;
}
