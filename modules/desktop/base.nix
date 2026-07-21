{ pkgs, ... }:

{
    programs.dconf.enable = true;

    services.gnome.gnome-keyring.enable = true;
    security.pam.services.greetd.enableGnomeKeyring = true;

    xdg.portal = {
        enable = true;
        xdgOpenUsePortal = true;
    };

    environment.systemPackages = with pkgs; [
        xdg-user-dirs
        xdg-utils
    ];
}
