{ config, pkgs, ... }:

{
    security.pam.services.greetd.enableGnomeKeyring = true;
    
    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                user = "greeter";
                command = ''
                    ${pkgs.lib.getExe pkgs.tuigreet} \
                    --time \
                    --remember \
                    --remember-user-session \
                    --user-menu \
                    --asterisks \
                    --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions
                '';
            };
        };
    };
}
