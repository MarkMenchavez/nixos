{ ... }:

{
    services.qemuGuest.enable = true;
    services.spice-vdagentd.enable = true;

    boot.kernelParams = [
        "video=Virtual-1:2048x1152@60"
    ];

    environment.sessionVariables = {
        WLR_NO_HARDWARE_CURSORS = "1";
    };    
}