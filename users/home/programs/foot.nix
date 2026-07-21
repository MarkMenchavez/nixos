{ ... }:

{
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
}