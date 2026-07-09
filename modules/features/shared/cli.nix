{ inputs, self, ... }: {
  flake.homeModules.cli = { pkgs, ... }: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in {
    imports = [
      self.homeModules.helix
    ];
    home.packages = [
      pkgs.tmux
      pkgs.htop
      pkgs.tree
      pkgs.yazi
      pkgs.lazygit
      pkgs.wget
      pkgs.btop
      pkgs.ffmpeg-full
      pkgs.yt-dlp
      pkgs.fzf
      pkgs.bat

      # programming shii, burde enten være en egen modul eller lag til i devshells egentlig
      pkgs.clang-tools

      selfpkgs.myGit
      selfpkgs.myFastfetch
    ];

    programs.eza = {
      enable = true;
      enableZshIntegration = true;
      icons = "auto";
      git = true;
    };
  };
}
