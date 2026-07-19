{ pkgs, ... }:

{
    imports = [
        ./mcdm-home-common.nix
    ];

    wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = true;
    };
    xdg.configFile."hypr/hyprland.lua".source = ./hyprland.lua;
}
