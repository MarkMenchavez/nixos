{ pkgs, ... }:

{
    environment.systemPackages = [ pkgs.fzf ];

    programs.fzf = {
        fuzzyCompletion = true;
        keybindings = true;
    };
}