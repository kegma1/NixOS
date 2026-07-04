{ inputs, self, lib, ... }: {
  flake.sharedModules.theme = { pkgs, ... }: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in {
    stylix.enable = true;

    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    stylix.polarity = "dark";

    stylix.opacity = {
      applications = 0.95;
      terminal = 0.95;
      desktop = 1.0;
      popups = 1.0;
    };
  };
}
