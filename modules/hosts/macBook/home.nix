{
  self,
  inputs,
  ...
}: {
  flake.homeModules.kennetmathisenModule = {pkgs, ...}: {
    imports = with self.homeModules; [
      kitty
      cli
      obsidian
      librewolf
    ];
    services.podman.enable = true;

    home.packages = with pkgs; [
      texliveBasic
      dive
      podman-tui
      docker-compose
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
    programs.zsh.initContent = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
    };

    home.stateVersion = "26.05";
  };
}
