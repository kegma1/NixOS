{inputs, self, ...}: {
  flake.nixosModules.nix = {pkgs, ...}: {
    imports = [
      self.nixosModules.nh
    ];
    nix.settings.experimental-features = ["nix-command" "flakes"];

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
      # Nix tooling
      nil
      nixd
      statix
      alejandra
      manix
      nix-inspect
      nvd
      nix-output-monitor
    ];
  };
}
