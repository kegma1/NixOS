{ inputs, self, ... }: {
  flake.nixosModules.cli = { pkgs, ... }: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in {
    imports = [
      self.nixosModules.zsh
    ];
    environment.systemPackages = [
      pkgs.tmux
      pkgs.helix
      pkgs.htop
      pkgs.tree
      pkgs.yazi
      pkgs.lazygit
      pkgs.wget
      pkgs.btop
      pkgs.ffmpeg-full
      pkgs.yt-dlp
      pkgs.fzf

      selfpkgs.myGit
      selfpkgs.myFastfetch
    ];
  };
}
