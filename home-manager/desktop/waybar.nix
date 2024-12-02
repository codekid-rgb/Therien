{
  mainBar = {
    layer = "top";
    position = "top";
    height = 30;
    output = [
      "DVI-D-1"
      "HDMI-A-2"
    ];
    modules-left = [ "sway/workspaces" "sway/mode" "wlr/taskbar" ];
    modules-center = [ "sway/window" "custom/hello-from-waybar" ];
    modules-right = [ "mpd" "custom/mymodule#with-css-id" "temperature" ];

    "hyprland/workspaces" = {
      disable-scroll = true;
      all-outputs = true;
  };
 };
}
