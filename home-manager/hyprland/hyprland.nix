{

   exec-once = "../startup.h";
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
     "DP-1, 2560x1600@60, 0x0, 1"
     "DP-2, 3840x2160@60, 2560x0, 1"
     ];
   }
