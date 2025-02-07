{
  mainBar = {
    layer = "top";
    position = "top";
    height = 30;
    output = [
      "DVI-D-1"
      "DP-1"
      "DP-2"
    ];
    modules-left = [ "hyprland/workspaces" "tray"];
    modules-center = [ "hyprland/window" ];
    modules-right = [ "wlr/taskbar" "cpu" "memory" "pulseaudio" "clock" ];

    "hyprland/workspaces" = {
      disable-scroll = true;
      all-outputs = true;
    };
    "hyprland/window" = {
      separate-outputs = true;
    };
    "tray" = {
      icon-size = 21;
      spacing = 10;
    };
    "clock" = {
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      format-alt = "{:%Y-%m-%d}";
    };
    "cpu" = {
      format = "{usage}% ";
      tooltip = false;
    };
    "memory" = {
      format = "{}% ";
    };
  };
}

