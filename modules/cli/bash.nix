{ pkgs, ... }:

{
    programs.bash = {
        enable = true;
        completion.enable = true;
        interactiveShellInit = ''
            if [[ $- == *i* ]] && [[ -n "$DISPLAY" || -n "$WAYLAND_DISPLAY" ]]; then
                #source <(starship init bash)
                eval "$(starship init bash)"
            fi
        '';
    };

    environment.systemPackages = [ pkgs.starship ];
    programs.starship.enable = false;
}