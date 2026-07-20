{ pkgs, ... }:

{
    imports = [
        ./common.nix
        ./graphics.nix
        ./pipewire.nix
        ./fonts.nix
    ];

    programs.sway = {
        enable = true;
        package = pkgs.swayfx;
        wrapperFeatures.gtk = true;
        xwayland.enable = true;
    };

    xdg.portal = {
        enable = true;

        extraPortals = with pkgs; [
            xdg-desktop-portal-wlr
            xdg-desktop-portal-gtk
        ];

        config = {
            common = {
                default = [
                    "wlr"
                    "gtk"
                ];
            };
        };
    };

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        MOZ_ENABLE_WAYLAND = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";

        WLR_NO_HARDWARE_CURSORS = "1";
    };


    environment.systemPackages = with pkgs; [
        foot
        alacritty        

        quickshell
        noctalia-qs
        noctalia-shell

        widevine-cdm
        libnotify

        #swaybg
        #swaylock
        swayidle

        wl-clipboard
        grim
        slurp
        #waybar
    ];
}