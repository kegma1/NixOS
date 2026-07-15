
{
  lib,
  self,
  inputs,
  ...
}: {
  flake.homeModules.desktop = {pkgs, config, ...}: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in {
    imports = with self.homeModules; [
      kitty
      waybar
      fuzzel
    ];

    services.mako = {
      enable = true;
      borderRadius = 12;
    };
    home.file.".config/niri/colors.kdl".text = ''
      layout {
        border {
          active-color "#${config.lib.stylix.colors.base0D}"
          inactive-color "#${config.lib.stylix.colors.base03}"
        }
      }
    '';
  };
}
