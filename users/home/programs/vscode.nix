{ pkgs, pkgs-unstable, ... }:

{
    #home.packages = with pkgs; [
    #    pkgs-unstable.vscode-fhs
    #    pkgs-unstable.vscode-extensions.continue.continue
    #]; 

    home.packages = [
        (pkgs-unstable.vscode-with-extensions.override {
            vscode = pkgs-unstable.vscode;
            vscodeExtensions = [
                pkgs-unstable.vscode-extensions.continue.continue
            ];
        })
    ];    
}