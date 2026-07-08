{ self, inputs, ... }: {
  flake.homeModules.kennetModule = { pkgs, ... }: {
    imports = [
      self.homeModules.kitty
      self.homeModules.waybar
      self.homeModules.fuzzel
      self.homeModules.helix
    ];

    home.stateVersion = "24.11";
  };

}
