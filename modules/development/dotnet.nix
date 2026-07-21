{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        dotnet-sdk_10
    ];

    # Nix stores the SDK outside the standard FHS path
    # Set DOTNET_ROOT so external tooling can locate the SDK.
    environment.variables = {
        DOTNET_ROOT = "${pkgs.dotnet-sdk_10}/share/dotnet";
    };
}