{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ../../modules/system
      ../../modules/cli
      ../../modules/development

      ../../users/mcdm.nix
    ];
}
