{ pkgs, ... }:

{
    users.users.mcdm = {
        isNormalUser = true;
        description = "Mark Menchavez";
        extraGroups = [
            "wheel"
            "networkmanager"
            "video"
            "input"
            "render"
        ];
        shell = pkgs.bash;
    };
}