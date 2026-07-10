{
  self,
  inputs,
  ...
}: {
  flake.homeModules.kennetmathisenModule = {pkgs, ...}: {
    imports = [
      self.homeModules.kitty
      self.homeModules.cli
    ];

    programs.helix = {
      languages = {
        language-server.nixd = {
          config = {
            nixd = {
              options = {
                nix-darwin.expr = ''(builtins.getFlake (toString ./.)).darwinConfigurations."kennetmathisen".options'';

                home-manager.expr = ''(builtins.getFlake (toString ./.)).darwinConfigurations."kennetmathisen".options.home-manager.users.type.getSubOptions []'';
              };
            };
          };
        };
      };
    };
    home.stateVersion = "26.05";
  };
}
