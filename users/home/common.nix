{ pkgs, ... }:

{
    imports = [
        ./programs/foot.nix
        ./programs/alacritty.nix
        ./programs/brave.nix
    ];

    home.username = "mcdm";
    home.homeDirectory = "/home/mcdm";

    home.stateVersion = "26.05";

    home.file.".face".source = ../../assets/mcdm.png;
    systemd.user.startServices = "sd-switch";

    programs.home-manager.enable = true;

    home.packages = with pkgs; [
        fastfetch

        cowsay
        lolcat
        fortune
        cmatrix
        asciiquarium-transparent
        fancy-motd

        htop
        gping
        speedtest-cli
            
        imv
        mpv
        
        yazi
        ffmpegthumbnailer
        imagemagick
        poppler
        chafa
        ueberzugpp
    ];

    gtk = {
        enable = true;

        theme = {
            name = "Adwaita-dark";
            package = pkgs.gnome-themes-extra;
        };

        gtk3.extraConfig = {
            gtk-application-prefer-dark-theme = 1;
        };
    };

    dconf.settings = {
        "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
            gtk-theme = "Adwaita-dark";
        };
    };
}