{
  self,
  inputs,
  ...
}: {
  flake.homeModules.kennetModule = {pkgs, config, ...}: {
    imports = with self.homeModules; [
      kitty
      waybar
      fuzzel
      cli
    ];

    programs.helix.languages.language-server.nixd.config.nixd.options = {
      home-manager.expr = ''(builtins.getFlake (toString ./.)).nixosConfigurations."desktop".options.home-manager.users.type.getSubOptions []'';
    };

    home.file.".config/niri/colors.kdl".text = ''
      layout {
        border {
          active-color "#${config.lib.stylix.colors.base0D}"
          inactive-color "#${config.lib.stylix.colors.base03}"
        }
      }
    '';
    qt.enable = true;
    home.stateVersion = "24.11";
  };
}
