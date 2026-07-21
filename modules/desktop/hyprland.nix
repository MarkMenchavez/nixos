{ pkgs, ... }:

{
    imports = [
        ./base.nix
        ./graphics.nix
        ./pipewire.nix
        ./fonts.nix
    ];

    programs.hyprland = {
        enable = true;
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
        MOZ_ENABLE_WAYLAND = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
    };
}
