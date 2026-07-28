{
    description = "NixOS configuration";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager/release-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    let
        lib = nixpkgs.lib;

        username = "mcdm";
        system = "aarch64-linux";

        pkgs-unstable = import inputs.nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
        };

        mkHomeModules = homeFile: [
            home-manager.nixosModules.home-manager
            {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.backupFileExtension = "backup";
                home-manager.overwriteBackup = true;

                home-manager.extraSpecialArgs = {
                    inherit
                        self
                        inputs
                        username
                        pkgs-unstable;
                };

                home-manager.users.${username} = import homeFile;
            }
        ];

        mkHost = { configuration, home }:
            lib.nixosSystem {
                inherit system;

                specialArgs = {
                    inherit 
                        self
                        inputs
                        username
                        pkgs-unstable;
                };

                modules = [ configuration ]
                    ++ mkHomeModules home;
            };
    in 
    {
        nixosConfigurations = {
            qemu-nixos-hyprland = mkHost {
                configuration = ./hosts/qemu-nixos-hyprland/configuration.nix;
                home = ./users/home/hyprland.nix;
            };

            qemu-nixos-swayfx = mkHost {
                configuration = ./hosts/qemu-nixos-swayfx/configuration.nix;
                home = ./users/home/swayfx.nix;
            };
        };
    };
}
