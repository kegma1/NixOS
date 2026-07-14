{
  self,
  inputs,
  ...
}: {
  flake.homeModules.kennetModule = {pkgs, config, ...}: {
    imports = with self.homeModules; [
      desktop
      cli
    ];

    programs.helix.languages.language-server.nixd.config.nixd.options = {
      home-manager.expr = ''(builtins.getFlake (toString ./.)).nixosConfigurations."desktop".options.home-manager.users.type.getSubOptions []'';
    };

    qt.enable = true;
    home.stateVersion = "24.11";
  };
}
