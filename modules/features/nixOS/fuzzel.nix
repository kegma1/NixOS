{
  lib,
  self,
  inputs,
  ...
}: {
  flake.homeModules.fuzzel = {pkgs, ...}: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in {
    stylix.targets.fuzzel.fonts.override.sizes.popups = 15;
    programs.fuzzel = {
      enable = true;
      settings.main = {
        terminal = "${lib.getExe pkgs.kitty} -e";
        show-actions = true;
        # keyboard-focus = "on-demand";
      };
    };
  };
}
