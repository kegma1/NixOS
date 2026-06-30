{ inputs, self, ... }: {
  flake.sharedModules.fonts = { pkgs, ... }: {
    fonts.packages = with pkgs; [
      nerd-fonts.comic-shanns-mono
    ];
  };
}
