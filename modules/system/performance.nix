{ ... }:

{
    boot.kernel.sysctl = {
        "vm.swappiness" = 10;
        "vm.dirty_ratio" = 10;
        "vm.dirty_background_ratio" = 5;
    };
}