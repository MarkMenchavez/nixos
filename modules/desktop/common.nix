{ pkgs, ... }:

{
    programs.dconf.enable = true;

    xdg.portal = {
        enable = true;
        xdgOpenUsePortal = true;
    };

    environment.systemPackages = with pkgs; [
        xdg-user-dirs
        xdg-utils
    ];
}
