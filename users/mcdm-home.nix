{ pkgs, ... }:

{
    home.username = "mcdm";
    home.homeDirectory = "/home/mcdm";

    home.stateVersion = "26.05";

    home.file.".face".source = ../assets/mcdm.png;

    programs.home-manager.enable = true;
    systemd.user.startServices = "sd-switch";
    wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = true;
    };
    xdg.configFile."hypr/hyprland.lua".source = ./hyprland.lua;

    programs.foot = {
        enable = true;
        server.enable = true;
        settings = {

            main = {
                include = "~/.config/foot/themes/noctalia";
                font = "JetBrainsMono Nerd Font:size=11";
            };

            colors-light = {
                background = "ffffff";
                alpha = 0.8;
            };

            colors-dark = {
                background = "000000";
                alpha = 0.8;
            };
        };
    };

    programs.alacritty = {
        enable = true;

        settings = {
            general = {
                import = [
                    "~/.config/alacritty/themes/noctalia.toml"
                ];
            };

            window = {
                opacity = 0.8;
                blur = true;
            };

            font = {
                size = 10;

                normal = {
                    family = "JetBrainsMono Nerd Font";
                    style = "Regular";
                };
            };

	    debug = {
                renderer = "gles2pure";
            };
        };
    };    
}
