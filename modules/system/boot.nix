{ pkgs, ... }:

{
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    boot.kernelPackages = pkgs.linuxPackages_latest;

    boot.kernel.sysctl = {
        "vm-swappiness" = 10;
        "vm.dirty_ratio" = 10;
        "vm.dirty_background_ratio" = 5;
    };

    boot.kernelParams = [
        "video=Virtual-1:2048x1152@60"
    ];
}