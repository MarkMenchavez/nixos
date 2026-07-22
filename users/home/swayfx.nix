{ pkgs, lib, ... }:

{
    imports = [
        ./common.nix
    ];

	home.packages = with pkgs; [
		noctalia-shell

		resources

		vscode-fhs

        wl-clipboard
		cliphist

        grim
        slurp

		pavucontrol
		brightnessctl
	];

    wayland.windowManager.sway = {
        enable = true;
		package = pkgs.swayfx;

		checkConfig = false;
		
		config = {
			modifier = "Mod4";

			terminal = "footclient";

			keybindings = lib.mkOptionDefault {
				"Mod4+shift+b"      = "exec ${pkgs.brave}/bin/brave";
				"Mod4+Mod1+b"       = "exec ${pkgs.brave}/bin/brave --incognito";
				"Mod4+shift+t"      = "exec ${pkgs.alacritty}/bin/alacritty";
				"Mod4+shift+f" 		= "exec ${pkgs.alacritty}/bin/alacritty -e ${pkgs.yazi}/bin/yazi";
				"Mod4+shift+i"      = "exec ${pkgs.vscode}/bin/code";

				"Mod4+space"        = ''exec noctalia-shell ipc call launcher toggle'';
				"Mod4+comma"        = ''exec noctalia-shell ipc call settings toggle'';
				"Mod4+period"       = ''exec noctalia-shell ipc call controlCenter toggle'';
				"Mod4+shift+r"      = ''exec noctalia-shell ipc call wallpaper random all'';
				"Mod4+shift+w"      = ''exec noctalia-shell ipc call wallpaper toggle'';
				"Mod4+shift+escape" = ''exec noctalia-shell ipc call lockScreen lock'';
			};

			gaps = {
				inner = 10;
				outer = 5;
			};

			bars = [ ];

	        output = {
				# QEMU defaults to a low resolution unless explicitly configured.
				"Virtual-1" = {
					mode = "2560x1440@75Hz";
                	pos  = "0 0";
				};
			};

			startup = [
				# Foot server is already enabled via programs.foot.server.enable = true
				#{ command = "foot --server"; }
				{ command = "noctalia-shell"; }
			];
		};
	
		extraConfig = ''
			default_border pixel 1
			default_floating_border pixel 1
		'';
    };
}

