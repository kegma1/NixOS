{ lib, self, inputs,  ... }: {
  flake.homeModules.waybar = { pkgs,  ... }: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in  {
    programs.waybar = {
      enable = true;    
      settings = {
        mainbar = {
          layer = "top";
          position = "left";
          width = 30;

          modules-left = [];
          modules-center = ["niri/workspaces"];
          modules-right = [];
          

          "niri/workspaces" = {
            format = "i";
          };
        };
      };
    
    };
  };
}
