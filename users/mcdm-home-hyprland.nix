{ pkgs, ... }:

{
    imports = [
        ./mcdm-home-common.nix
    ];
	
    home.packages = [
		pkgs.widevine-cdm
		pkgs.brave
	];

	home.file.".config/BraveSoftware/Brave-Browser/WidevineCdm/latest-component-updated-widevine-cdm".text =
		builtins.toJSON { Path = "${pkgs.widevine-cdm}/share/google/chrome/WidevineCdm"; };

    wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = true;
    };
    xdg.configFile."hypr/hyprland.lua".source = ./hyprland.lua;
}
