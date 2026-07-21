{ ... }:

{
    imports = [
        ./nix.nix
        ./boot.nix
        ./locale.nix
        ./networking.nix
        ./storage.nix
        ./polkit.nix
        ./power.nix
        ./performance.nix
    ];
}