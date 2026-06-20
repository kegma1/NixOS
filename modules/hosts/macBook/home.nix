{ self, inputs, ... }: {

  # This is your standalone home-manager configuration, meant to be used on non-nixos machines
  # with the home-manager command
  flake.homeConfigurations.kennetmathisen = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "aarch64-darwin"; };
    modules = [
      self.homeModules.kennetmathisenModule
      {
        home.username = "kennetmathisen";
        home.homeDirectory = "/Users/kennetmathisen/";
      }
    ];
  };

  # This is your home.nix, your module where you configure home-manager
  # It's imported both in standalone configuration above, and in your nixos configuration
  flake.homeModules.kennetmathisenModule = { pkgs, ... }: {
    imports = [
      self.homeModules.kitty
    ];

    home.stateVersion = "26.05";
  };

}
