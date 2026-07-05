{ lib, self, inputs,  ... }: {
  flake.homeModules.waybar = { pkgs,  ... }: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in  {
    programs.waybar.enable = true;    
  };
}
