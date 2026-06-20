{ self, inputs, ... }: {

  # This is your standalone home-manager configuration, meant to be used on non-nixos machines
  # with the home-manager command
  flake.homeConfigurations.kennet = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    modules = [
      self.homeModules.kennetModule
      {
        home.username = "kennet";
        home.homeDirectory = "/home/kennet";
      }
    ];
  };

  # This is your home.nix, your module where you configure home-manager
  # It's imported both in standalone configuration above, and in your nixos configuration
  flake.homeModules.kennetModule = { pkgs, ... }: {
    imports = [
      self.homeModules.kitty
    ];

    home.stateVersion = "24.11";
  };

}
