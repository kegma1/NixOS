
{
  inputs,
  self,
  ...
}: {
  flake.homeModules.zed-editor = {pkgs, ...}: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in {
    programs.zed-editor = {
      enable = true;
      userSettings = {
        ssh_connections= [
          {
            host= "ificluster.ifi.uit.no";
            username= "kma150";
            args= [];
            projects= [
              {
                paths= [
                  "/mnt/users/kma150"
                ];
              }
            ];
          }
        ];
        agent= {
          favorite_models= [];
          model_parameters= [];
          auto_compact= {
            threshold= "90%";
          };
        };
        helix_mode= true;
        vim_mode= false;
        base_keymap= "Zed";
        # theme= {
        #   mode= "system";
        #   light= "Gruvbox Light";
        #   dark= "Gruvbox Dark";
        # };
        
      };
    };
  };
}
