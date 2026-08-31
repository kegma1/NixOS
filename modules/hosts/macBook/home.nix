{
  self,
  inputs,
  ...
}: {
  flake.homeModules.kennetmathisenModule = {pkgs, ...}: {
    imports = [
      self.homeModules.kitty
      self.homeModules.cli
      self.homeModules.zed-editor
    ];

    home.packages = [
    ];

    programs.helix = {
      languages = {
        language-server.nixd = {
          config = {
            nixd = {
              options = {
                nix-darwin.expr = ''(builtins.getFlake (toString ./.)).darwinConfigurations."macBook".options'';

                home-manager.expr = ''(builtins.getFlake (toString ./.)).darwinConfigurations."macBook".options.home-manager.users.type.getSubOptions []'';
              };
            };
          };
        };
      };
    };
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
    };

    home.stateVersion = "26.05";
  };
}
