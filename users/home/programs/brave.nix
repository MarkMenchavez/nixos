{ pkgs, ... }:

{
    programs.brave.enabled = true;
    
	# Point Brave's Widevine loader to the Nix-provided Widevine package.
	home.file.".config/BraveSoftware/Brave-Browser/WidevineCdm/latest-component-updated-widevine-cdm".text =
		builtins.toJSON { Path = "${pkgs.widevine-cdm}/share/google/chrome/WidevineCdm"; };
}