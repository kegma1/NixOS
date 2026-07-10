{
  lib,
  self,
  inputs,
  ...
}: {
  flake.homeModules.fuzzel = {pkgs, ...}: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in {
    programs.fuzzel.enable = true;
  };
}
