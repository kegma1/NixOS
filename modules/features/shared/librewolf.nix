{
  lib,
  self,
  inputs,
  ...
}: {
  flake.homeModules.librewold = {pkgs, ...}: {
    programs.librewolf = {
      enable = true;
    };
  };
}
