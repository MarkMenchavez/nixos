{
    description = "NixOS configuration";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

        home-manager = {
            url = github:nix-community/home-manager/release-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, home-manager, ... }:
    {
        nixosConfigurations.qemu-nixos-hyprland =
            nixpkgs.lib.nixosSystem {
                system = "aarch64-linux";

                modules = [
                    ./hosts/qemu-nixos-hyprland/configuration.nix

                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.mcdm =
                            import ./users/mcdm-home.nix;
                    };
                ];
            };
    };
}