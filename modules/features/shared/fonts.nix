{ inputs, self, ... }: {
  flake.sharedModules.fonts = { pkgs, ... }: {
    fonts.packages = with pkgs; [
      nerd-fonts.comic-shanns-mono
      nerd-fonts.iosevka
      nerd-fonts.jetbrains-mono
      nerd-fonts.ubuntu
      nerd-fonts.ubuntu-mono
    ];
  };
}
