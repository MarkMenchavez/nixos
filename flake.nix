{
    description = "NixOS configuration";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

        home-manager = {
            url = "github:nix-community/home-manager/release-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, ... }:
    let mkHomeManager = homeFile: [
        home-manager.nixosModules.home-manager
        {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.mcdm = import homeFile;
        }
    ];
    in {

        nixosConfigurations.qemu-nixos-hyprland =
            nixpkgs.lib.nixosSystem {
                system = "aarch64-linux";

                modules = 
                    [ ./hosts/qemu-nixos-hyprland/configuration.nix ]
                    ++ mkHomeManager ./users/mcdm-home-hyprland.nix;
        };

        nixosConfigurations.qemu-nixos-swayfx =
            nixpkgs.lib.nixosSystem {
                system = "aarch64-linux";

                modules = 
                    [ ./hosts/qemu-nixos-swayfx/configuration.nix ]
                    ++ mkHomeManager ./users/mcdm-home-swayfx.nix;
        };
    };
}
