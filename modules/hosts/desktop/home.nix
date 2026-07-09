{ self, inputs, ... }: {
  flake.homeModules.kennetModule = { pkgs, ... }: {
    imports = [
      self.homeModules.kitty
      self.homeModules.waybar
      self.homeModules.fuzzel
      self.homeModules.helix
    ];

    qt.enable = true;
    home.stateVersion = "24.11";
  };

}
