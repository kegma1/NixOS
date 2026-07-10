{
  inputs,
  self,
  lib,
  ...
}: {
  flake.sharedModules.theme = {pkgs, ...}: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in {
    stylix.enable = true;

    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    stylix.polarity = "dark";

    stylix.opacity = {
      applications = 0.95;
      terminal = 0.95;
      desktop = 0.95;
      popups = 1.0;
    };

    stylix.fonts = {
      serif = {
        package = pkgs.nerd-fonts.iosevka;
        name = "Iosevka Nerd Font Propo";
      };

      sansSerif = {
        package = pkgs.nerd-fonts.iosevka;
        name = "Iosevka Nerd Font Propo";
      };

      monospace = {
        package = pkgs.nerd-fonts.iosevka;
        name = "Iosevka Nerd Font Mono";
      };

      # emoji = {
      #   package = pkgs.noto-fonts-color-emoji;
      #   name = "Noto Color Emoji";
      # };
    };
  };
}
