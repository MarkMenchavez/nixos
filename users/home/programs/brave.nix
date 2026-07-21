{ pkgs, ... }:

{
    home.packages = with pkgs; [
		brave
		widevine-cdm
    ];
    
	# Point Brave's Widevine loader to the Nix-provided Widevine package.
	xdg.configFile."BraveSoftware/Brave-Browser/WidevineCdm/latest-component-updated-widevine-cdm".text =
		builtins.toJSON { Path = "${pkgs.widevine-cdm}/share/google/chrome/WidevineCdm"; };
}