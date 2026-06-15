{ inputs, self, ... }: {
  flake.nixosModules.cli = { pkgs, ... }: {
    imports = [
      self.nixosModules.git
      self.nixosModules.fastfetch
      self.nixosModules.zsh
      self.nixosModules.kitty
    ];
    environment.systemPackages = with pkgs; [
      tmux
      helix
      htop
      tree
    ];
  };
}
