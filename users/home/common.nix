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
    ];
}