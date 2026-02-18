{ pkgs, ... }:{
  xdg.dataFile = {
    "v2rayN/bin/sing_box/sing-box".source = "${pkgs.sing-box}/bin/sing-box";
  };
}
