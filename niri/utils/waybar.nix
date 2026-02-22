{ ... }: {
  programs.waybar = {
    enable = true;

    settings = [{
      layer = "bottom";

      modules-left = [ "niri/workspaces" "niri/window" ];
      modules-center = [ "clock" ];
      modules-right = [ "tray" "battery" "cpu" "memory" ];

      pulseaudio = {
        format = "vol: {volume}%";
        "on-click" = "swayosd-client --output-volume mute-toggle";
        "on-click-right" = "flatpak run com.saivert.pwvucontrol";
      };
      
      "niri/workspaces" = {
        format = "{index}";
      };

      clock = {
        format = "{:%d %b %H:%M}";
        interval = 1;
        "tooltip-format" = "{:%A %d %B %Y}";
      };

      tray = {
        spacing = 12;
      };

      memory = {
        format = "mem: {percentage}%";
        interval = 1;
      };

      cpu = {
        format = "cpu: {usage}%";
        interval = 1;
      };
    }];

    style = ''
      window#waybar {
        background-color: rgba(30, 30, 46, 0.93);
        color: #cdd6f4;
        transition-property: background-color;
        transition-duration: .5s;
        border-bottom: 1px solid rgba(144, 140, 170, 0.35);
      }

      * {
        font-family: "MonaspiceNe Nerd Font";
        font-size: 10pt;
      }

      #workspaces button {
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 8px;
        padding-right: 8px;
        background-color: transparent;
        border-radius: 100%;
        border: 6px #f5c2e7;
        font-weight: 800;
        color: #a6adc8; 
      }

      #workspaces button.urgent {
        color: #fab387;
      }

      #workspaces button:hover {
        background: rgba(69, 71, 90, 0.65);
        color: #cdd6f4;
        border: 12px #f5c2e7;
        transition: none;
      }

      #workspaces button.focused {
        color: #f5c2e7;
        border: 12px #f5c2e7;
      }

      label.module {
        padding: 0 10px 0 10px;
      }

      box.module button:hover {
        box-shadow: none;
        outline: none;
        font-style: normal;
        text-shadow: none;
      }

      #tray {
        padding: 0 8 0 8;
      }

      menu {
        background-color: #1e1e2e;
        color: #cdd6f4;
        border: 1px solid #494d64;
        padding: 6px;
        border-radius: 12px;
      }

      #tray menu menuitem:hover {
        background-color: #1e1e2e;
        color: #f5c2e7;
        border-radius: 5px;
      }

      #window {
        font-weight: 800;
        padding: 0px 8px 0px 8px;
      }
    '';
  };
}
