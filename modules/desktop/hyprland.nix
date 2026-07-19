{ pkgs, ... }:

{
    imports = [
        ./common.nix
        ./graphics.nix
        ./pipewire.nix
        ./fonts.nix
    ];

    programs.hyprland = {
        enable = true;
        withUWSM = true;
        xwayland.enable = true;
    };

    xdg.portal = {
        extraPortals = with pkgs; [
            xdg-desktop-portal-hyprland
            xdg-desktop-portal-gtk
        ];

        config = {
            common = {
                default = [ "hyprland" "gtk" ];
            };
        };
    };

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        WLR_NO_HARDWARE_CURSORS = "1";
        MOZ_ENABLE_WAYLAND = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
    };

    environment.systemPackages = with pkgs; [
        foot
        alacritty

        quickshell
        noctalia-qs
        noctalia-shell

        widevine-cdm
        libnotify

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
}
