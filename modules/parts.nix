{inputs, ...}: {
  imports = [
    # adds home-manager options to flake-parts
    inputs.home-manager.flakeModules.home-manager
  ];
  options = {
    flake = inputs.flake-parts.lib.mkSubmoduleOptions {
      darwinModules = inputs.nixpkgs.lib.mkOption {
        default = {};
      };
    };
  };


  config = {
    systems = [
      "x86_64-linux"
      "x86_64-darwin"
      "aarch64-linux"
      "aarch64-darwin"
    ];
  };
}
