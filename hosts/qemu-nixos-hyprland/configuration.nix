{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix

      ../../modules/virtualization/qemu.nix

      ../../modules/system
      ../../modules/cli
      ../../modules/development

      ../../modules/desktop/greetd.nix
      .,/../modules/desktop/hyprland.nix

      ../../users/mcdm.nix
    ];

  networking.hostName = "qemu-nixos-hyprland";
 
  system.stateVersion = "26.05";
}
