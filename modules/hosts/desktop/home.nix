{ self, inputs, ... }: {
  flake.homeModules.kennetModule = { pkgs, ... }: {
    imports = [
      self.homeModules.kitty
      self.homeModules.waybar
      self.homeModules.fuzzel
    ];

    home.stateVersion = "24.11";
  };

}
