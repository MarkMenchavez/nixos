{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        bat
        zip
        unzip
        curl
        wget
        fd
        jq
        ripgrep
        tree
        eza
    ];
}