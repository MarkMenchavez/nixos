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

    # This is intentional.
    # Enabling programs.starship.enable automatically injects Starship
    # initialization into Bash, which prevents conditional loading only
    # for graphical sessions.
    environment.systemPackages = [ pkgs.starship ];
    programs.starship.enable = false;
}