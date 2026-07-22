{ ... }:

{
    boot.kernel.sysctl = {
        "vm.swappiness" = 180;
        "vm.dirty_ratio" = 10;
        "vm.dirty_background_ratio" = 5;
    };

    zramSwap = {
        enable = true;
        algorithm = "zstd";
        memoryPercent = 50;
        priority = 100;
    };

    systemd.oomd.enable = true;

    swapDevices = [
        {
            device = "/swapfile";
            size = 8192;
            priority = 0;
        }
    ];
}