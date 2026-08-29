{
  flake.modules.finix.programs.vxwm = {
    lib,
    pkgs,
    ...
  }: let
    vxwm = pkgs.stdenv.mkDerivation {
      pname = "vxwm";
      version = "2.3-unstable-2026-07-27";

      src = pkgs.fetchgit {
        url = "https://codeberg.org/wh1tepearl/vxwm.git";
        rev = "8b9f04c415a96c92fc36b7639cd1877903f3f0eb";
        hash = "sha256-YUDkr2J4tR59Nx9MdO28NkvE5xlDUAZ5Pnmd23nwcHE=";
      };

      nativeBuildInputs = [pkgs.pkg-config];
      buildInputs = with pkgs; [
        libX11
        libXft
        libXinerama
        fontconfig
      ];

      postPatch = ''
              substituteInPlace config.mk \
                --replace-fail 'PREFIX = /usr/local' 'PREFIX = '$out \
                --replace-fail 'X11INC = /usr/X11R6/include' 'X11INC = ${pkgs.libX11.dev}/include' \
                --replace-fail 'X11LIB = /usr/X11R6/lib' 'X11LIB = ${pkgs.libX11.out}/lib' \
                --replace-fail 'FREETYPEINC = /usr/include/freetype2' 'FREETYPEINC = ${pkgs.freetype.dev}/include/freetype2'

              substituteInPlace config.def.h \
                --replace-fail '"monospace:size=10"' '"FiraCode Nerd Font Mono:size=10"' \
                --replace-fail '"#222222"' '"#1e1e2e"' \
                --replace-fail '"#444444"' '"#585b70"' \
                --replace-fail '"#bbbbbb"' '"#cdd6f4"' \
                --replace-fail '"#eeeeee"' '"#cdd6f4"' \
                --replace-fail '"#005577"' '"#89b4fa"' \
                --replace-fail '"dmenu_run", "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbordercolor, "-sf", selfgcolor' '"rofi", "-show", "drun"' \
                --replace-fail '"st", NULL' '"alacritty", NULL' \
                --replace-fail 'XK_t,      setlayout,      {.v = &layouts[0]}' 'XK_t,      setlayout,      {.v = &layouts[1]}' \
                --replace-fail 'XK_f,      setlayout,      {.v = &layouts[1]}' 'XK_f,      setlayout,      {.v = &layouts[0]}' \
                --replace-fail '{ MODKEY,                       XK_space,  setlayout,      {0} },' '/* Mod+Space is reserved for XKB group switching. */' \
                --replace-fail '{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },' '{ MODKEY, XK_d, spawn, {.v = dmenucmd } },
        { MODKEY, XK_s, spawn, SHCMD("maim -s $HOME/$(date +%F-%T).png") },' \
                --replace-fail '{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },' '{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },' \
                --replace-fail '{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },' '{ MODKEY,                       XK_p,      incnmaster,     {.i = -1 } },' \
                --replace-fail '{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },' '{ MODKEY,                       XK_q,      killclient,     {0} },' \
                --replace-fail '{ MODKEY,                       XK_q,      enhancedtogglefloating, {0} },' '{ MODKEY,                       XK_e,      enhancedtogglefloating, {0} },' \
                --replace-fail '{ Mod1Mask,                     KEY,      tag,            {.ui = 1 << TAG} },' '{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} },'

              substituteInPlace modules.def.h \
                --replace-fail '#define ZOOM 1' '#define ZOOM 0' \
                --replace-fail '#define TAG_TO_TAG 1' '#define TAG_TO_TAG 0'

              substituteInPlace modules/directionalfocus/directionalfocus.c \
                --replace-fail 'if (!s)' 'if (!s || s->isfullscreen)' \
                --replace-fail 'int isfloating = s->isfloating;' '/* Allow focus across floating and tiled windows. */' \
                --replace-fail 'if (!ISVISIBLE(c) || c->isfloating != isfloating)' 'if (!ISVISIBLE(c) || c->isfullscreen)'
      '';

      installPhase = ''
        make install PREFIX=$out MANPREFIX=$out/share
      '';

      meta.mainProgram = "vxwm";
    };

    vxwmSession = pkgs.writeShellScript "vxwm-session" ''
      ${pkgs.xrandr}/bin/xrandr --output DP-2 --mode 1920x1080 --rate 165
      ${pkgs.xrandr}/bin/xrandr --output HDMI-1 --mode 1920x1080 --rate 60

      if ! ${pkgs.procps}/bin/pgrep -x pipewire >/dev/null; then
        ${pkgs.pipewire}/bin/pipewire 2>&1 &
        sleep 0.5
      fi
      if ! ${pkgs.procps}/bin/pgrep -x wireplumber >/dev/null; then
        ${pkgs.wireplumber}/bin/wireplumber 2>&1 &
        sleep 0.5
      fi
      if ! ${pkgs.procps}/bin/pgrep -x pipewire-pulse >/dev/null; then
        ${pkgs.pipewire}/bin/pipewire-pulse 2>&1 &
      fi

      (
        while true; do
          ${pkgs.xsetroot}/bin/xsetroot -name "$(${pkgs.coreutils}/bin/date '+%H:%M')"
          ${pkgs.coreutils}/bin/sleep 30
        done
      ) &

      ${pkgs.picom}/bin/picom --config "''${XDG_CONFIG_HOME:-$HOME/.config}/picom/picom.conf" &
      exec ${vxwm}/bin/vxwm
    '';

    sessionFile = pkgs.writeTextDir "share/xsessions/vxwm.desktop" ''
      [Desktop Entry]
      Name=vxwm
      Comment=Versatile X Window Manager
      Exec=${pkgs.dbus}/bin/dbus-run-session -- ${vxwmSession}
      TryExec=${vxwm}/bin/vxwm
      Type=Application
      DesktopNames=vxwm
    '';
  in {
    environment.systemPackages = [vxwm (lib.hiPrio sessionFile)];
  };
}
