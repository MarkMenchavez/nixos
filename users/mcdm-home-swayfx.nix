{ pkgs, lib, ... }:

{
    imports = [
        ./mcdm-home-common.nix
    ];

    wayland.windowManager.sway = {
        enable = true;
		package = pkgs.swayfx;

		checkConfig = false;
		
		config = {
			modifier = "Mod4";

			keybindings = lib.mkOptionDefault {
				"Mod4+shift+b      " = "exec ${pkgs.brave}/bin/brave --incognito";
				"Mod4+shift+return " = ''exec noctalia-shell ipc call launcher toggle'';
				"Mod4+comma        " = ''exec noctalia-shell ipc call settings toggle'';
				"Mod4+period       " = ''exec noctalia-shell ipc call controlCenter toggle'';
				"Mod4+shift+r      " = ''exec noctalia-shell ipc call wallpaper random all'';
				"Mod4+shift+w      " = ''exec noctalia-shell ipc call wallpaper toggle'';
				"Mod4+shift+escape " = ''exec noctalia-shell ipc call lockScreen lock'';
			};

			gaps = {
				inner = 10;
				outer = 5;
			};

			bars = [ ];

	        output = {
			"Virtual-1" = {
				mode = "2048x1152@60Hz";
                		pos  = "0 0";
			};
		};

		startup = [
			{ command = "noctalia-shell"; }
		];
	};
	
	extraConfig = ''
		default_border pixel 1
		default_floating_border pixel 1
		'';
    };
}
