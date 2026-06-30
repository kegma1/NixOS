{ inputs, self, ... }: {
  flake.sharedModules.cli = { pkgs, ... }: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in {
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
