
{ lib, self, inputs,  ... }: {
  flake.homeModules.helix = { pkgs,  ... }: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in  {
    programs.helix = {
      enable = true;    
      settings = {
        editor = {
          bufferline = "multiple";
          soft-wrap.enable = true;
          auto-save.after-delay.enable = true;
          line-number = "relative";
          mouse = true;
          cursor-shape = {
            normal =  "block";
            insert = "bar";
            select = "underline";
          };
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
