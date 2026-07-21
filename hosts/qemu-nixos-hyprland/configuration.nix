{ ... }:

{
  imports =
    [ 
      ../common

      ./hardware-configuration.nix

      ../../modules/virtualization/qemu.nix

      ../../modules/desktop/greetd.nix
      ../../modules/desktop/hyprland.nix
    ];

  networking.hostName = "qemu-nixos-hyprland";
 
  system.stateVersion = "26.05";
}
