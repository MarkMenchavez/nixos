{ ... }:

{
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

        # Workaround for rendering issues
	    debug = {
                renderer = "gles2pure";
            };
        };
    };        
}