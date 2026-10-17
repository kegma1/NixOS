
{
  inputs,
  self,
  ...
}: {
  flake.homeModules.gram = {pkgs, ...}: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in {
    programs.gram = {
     enable = true;
     settings = {
        ssh_connections = [
          {
            host = "ificluster.ifi.uit.no";
            username = "kma150";
            args = [];
            projects = [
              {
                paths = [
                  "/mnt/users/kma150"
                ];
              }
            ];
          }
        ];
        helix_mode = true;
        vim_mode = false;
      };
    };
  };
}
