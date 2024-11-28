{

   exec-once = "../startup.sh";
   decoration = {
        "shadow_offset" = "0 5";
	"col.shadow" = "rgba(00000099)";
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
     ];
     monitor = [
     "DP-0, 2560x1600@59.9, 0x0, 1"
     "DP-1, 3840x2160@59.9, auto-left, 1"
     ];
   }
