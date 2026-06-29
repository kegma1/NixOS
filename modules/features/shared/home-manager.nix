{ self, inputs, ... }: {

  # This is your module that imports and configures home-manager
  flake.nixosModules.myHomeManager = { pkgs, ... }: {
    imports = [
      inputs.home-manager.nixosModules.default # import official home-manager NixOS module
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };
  flake.darwinModules.myHomeManager = { pkgs, ... }: {
    imports = [
      inputs.home-manager.darwinModules.default # import official home-manager darwin module
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };

}
