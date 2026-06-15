{ inputs, self, ... }: {
  flake.nixosModules.fonts = { pkgs, ... }: {
    fonts.packages = with pkgs; [
      nerd-fonts.comic-shanns-mono
    ];
  };
}
