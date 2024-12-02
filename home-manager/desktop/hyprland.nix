{

   exec-once = "waybar & swww init & swww img ~/wallpaper/wallpaper.png";
   general = {
    "gaps_in" = "5";
    "gaps_out" = "20";

    "border_size" = "2";

    # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
    "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
    "col.inactive_border" = "rgba(595959aa)";

    # Set to true enable resizing windows by clicking and dragging on borders and gaps
    "resize_on_border" = "true";

    # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
    "allow_tearing" = "false";


   };


   decoration = {
        "shadow_offset" = "0 5";
	"col.shadow" = "rgba(00000099)";
	"rounding" = "10";
     };
     "$mod" = "SUPER";

     bindm = [
     "$mod, mouse:272, movewindow"
     "$mod, mouse:273, resizewindow"
     "$mod ALT, mouse:272, resizewindow"
     ];
     bind = [
     "$mod, Return, exec, alacritty"
     "$mod, p, exec, rofi -show run"
     "$mod, Backspace, killactive"
       "$mod, left, movefocus, l"
       "$mod, right, movefocus, r"
       "$mod, up, movefocus, u"
       "$mod, down, movefocus, d"
       "$mod, l, exec, systemctl suspend"
       # Switch workspaces with mainMod + [0-9]
	"$mod, 1, workspace, 1"
	"$mod, 2, workspace, 2"
	"$mod, 3, workspace, 3"
	"$mod, 4, workspace, 4"
	"$mod, 5, workspace, 5"
	"$mod, 6, workspace, 6"
	"$mod, 7, workspace, 7"
	"$mod, 8, workspace, 8"
	"$mod, 9, workspace, 9"
	"$mod, 0, workspace, 10"
	"$mod SHIFT, 1, movetoworkspace, 1"
	"$mod SHIFT, 2, movetoworkspace, 2"
	"$mod SHIFT, 3, movetoworkspace, 3"
	"$mod SHIFT, 4, movetoworkspace, 4"
	"$mod SHIFT, 5, movetoworkspace, 5"
	"$mod SHIFT, 6, movetoworkspace, 6"
	"$mod SHIFT, 7, movetoworkspace, 7"
	"$mod SHIFT, 8, movetoworkspace, 8"
	"$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
     ];
     monitor = [
     "HDMI-A-1, highrr, 2560x0, 1"
     "DVI-D-1, 2560x1600@59.86000, 0x0, 1"
     "Unknown-1, disable"
     ];
   }
