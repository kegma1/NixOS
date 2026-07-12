{
  self,
  inputs,
  ...
}: {
  flake.homeModules.kennetModule = {pkgs, ...}: {
    imports = [
      self.homeModules.kitty
      self.homeModules.waybar
      self.homeModules.fuzzel
      self.homeModules.cli
    ];

    programs.helix.languages.language-server.nixd.config.nixd.options = {
      home-manager.expr = ''(builtins.getFlake (toString ./.)).nixosConfigurations."desktop".options.home-manager.users.type.getSubOptions []'';
    };

    qt.enable = true;
    home.stateVersion = "24.11";
  };
}
