{ pkgs, ... }:

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
