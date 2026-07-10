{ self, inputs, ... }: {
  flake.homeModules.kennetmathisenModule = { pkgs, ... }: {
    imports = [
      self.homeModules.kitty
      self.homeModules.cli
    ];

    home.stateVersion = "26.05";
  };

}
