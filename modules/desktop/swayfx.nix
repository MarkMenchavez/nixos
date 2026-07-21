{ pkgs, lib, ... }:

{
    imports = [
        ./base.nix
        ./graphics.nix
        ./pipewire.nix
        ./fonts.nix
    ];

    security.pam.services.sway.enableGnomeKeyring = true;

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
            sway = {
                default = lib.mkForce [
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
    };
}