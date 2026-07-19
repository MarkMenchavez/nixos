{ pkgs, ... }:

{
    imports = [
        ./mcdm-home-common.nix
    ];

    wayland.windowManager.sway = {
        enable = true;
	config = {
		modifier = "Mod4";
	}
    };

    #xdg.configFile."sway/config".source = ./swayfx/config;
}
