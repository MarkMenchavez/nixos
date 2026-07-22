{ ... }:

{
    services.qemuGuest.enable = true;
    services.spice-vdagentd.enable = true;

    boot.kernelParams = [
        "video=Virtual-1:2560x1440@75"
    ];

    environment.sessionVariables = {
        WLR_NO_HARDWARE_CURSORS = "1";
    };    
}