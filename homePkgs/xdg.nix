{ pkgs, ... }:{
  xdg.dataFile = {
    "v2rayN/bin/sing_box/sing-box".source = "${pkgs.sing-box}/bin/sing-box";
  };
  
  xdg.desktopEntries = {
    "Helix" = {
      name = "Helix";
      exec = "hx %F";
      noDisplay = true;
    };
    "qt5ct" = {
      name = "Qt5 Configuration Tool";
      exec = "qt5ct";
      noDisplay = true;
    };
    "qt6ct" = {
      name = "Qt6 Configuration Tool";
      exec = "qt6ct";
      noDisplay = true;
    };
    "kvantummanager" = {
      name = "Kvantum Manager";
      exec = "kvantummanager";
      noDisplay = true;
    };
  };

}
