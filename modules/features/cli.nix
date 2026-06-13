{ inputs, self, ... }: {
  flake.nixosModules.cli = { pkgs, ... }: {
    imports = [
      self.nixosModules.git
      self.nixosModules.fastfetch
    ];
    environment.systemPackages = with pkgs; [
      tmux
      helix
      htop
    ];
  };
}
