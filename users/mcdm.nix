{ config, pkgs, ... }:

{
    users.users.mcdm = {
        isNormalUser = true;
        description = "Mark Menchavez";
        extraGroups = [
            "wheel"
            "networkmanager"
            "video"
            "input"
        ];
        shell = pkgs.bash;

        packages = with pkgs; [
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

            brave
            vscode-fhs
        ];
    };
}