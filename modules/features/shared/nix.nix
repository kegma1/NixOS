{inputs, self, ...}: {
  flake.sharedModules.nix = {pkgs, ...}: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in {
    nix.settings.experimental-features = ["nix-command" "flakes"];

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = [
      # Nix tooling
      pkgs.nil
      pkgs.nixd
      pkgs.statix
      pkgs.alejandra
      pkgs.manix
      pkgs.nix-inspect
      pkgs.nvd
      pkgs.nix-output-monitor

      selfpkgs.myNh
    ];
  };

  perSystem = { pkgs, ... }: {
    packages.myNh = inputs.wrapper-modules.wrappers.nh.wrap {
      inherit pkgs;
      flake = "$HOME/NixOS";
    };
  };
}
