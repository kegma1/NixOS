{ inputs, self, ... }: {
  flake.nixosModules.cli = { pkgs, ... }: {
    imports = [
      self.nixosModules.git
    ];
    environment.systemPackages = with pkgs; [
      tmux
      helix
      fastfetch
      htop
    ];
  };
}
