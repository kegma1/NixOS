
{ lib, self, inputs,  ... }: {
  flake.homeModules.helix = { pkgs,  ... }: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in  {
    programs.helix = {
      enable = true;    
      settings = {
        editor = {
          line-number = "relative";
        };
        keys = {
          normal = {
            esc = [
              "collapse_selection"
              "keep_primary_selection"
            ];
            "C-g" = [ ":new" ":insert-output lazygit" ":buffer-close!" ":redraw" ];
          };
        }; 
      };
    };
  };
}
