{ pkgs, ... }:

{
    home.username = "mcdm";
    home.homeDirectory = "/home/mcdm";

    home.stateVersion = "26.05";

    programs.home-manager.enable = true;
}