{pkgs, ...}: {
  xdg.dataFile = {
    "v2rayN/bin/sing_box/sing-box".source = "${pkgs.sing-box}/bin/sing-box";
  };

  xdg.desktopEntries = {
    "Helix" = {
      name = "Helix";
      noDisplay = true;
    };
    "qt5ct" = {
      name = "Qt5 Configuration Tool";
      noDisplay = true;
    };
    "qt6ct" = {
      name = "Qt6 Configuration Tool";
      noDisplay = true;
    };
    "kvantummanager" = {
      name = "Kvantum Manager";
      noDisplay = true;
    };
    "kitty" = {
      name = "kitty";
      noDisplay = true;
    };
    "blueman-adapters" = {
      name = "Bluetooth Adaptors";
      noDisplay = true;
    };
  };
}
