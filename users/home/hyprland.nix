{ pkgs, ... }:

{
    imports = [
        ./common.nix
    ];

	home.packages = with pkgs; [
        noctalia-shell

        brightnessctl
        playerctl

        wl-clipboard
        grim
        slurp

        #waybar
        #hyprpaper
        #hypridle
        #hyprlock

        hyprlauncher
        hyprsysteminfo
        hyprpwcenter

        hyprpolkitagent
        hyprshutdown
	];    
	
    wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = true;
    };

    xdg.configFile."hypr/hyprland.lua".source = ./hyprland.lua;
}
