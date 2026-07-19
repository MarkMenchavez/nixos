{ pkgs, ... }:

{
    imports = [
        ./mcdm-home-common.nix
    ];

    wayland.windowManager.sway = {
        enable = true;
    };

    xdg.configFile."sway/config".source = ./swayfx/config;
}
