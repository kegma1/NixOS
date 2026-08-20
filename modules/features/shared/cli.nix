{
  inputs,
  self,
  ...
}: {
  flake.homeModules.cli = {pkgs, ...}: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in {
    imports = [
      self.homeModules.helix
    ];
    home.packages = [
      pkgs.htop
      pkgs.tree
      pkgs.yazi
      pkgs.lazygit
      pkgs.wget
      pkgs.btop
      pkgs.ffmpeg
      pkgs.yt-dlp
      pkgs.fzf
      pkgs.bat
      pkgs.zip
      pkgs.unzip
      pkgs.file

      # programming shii, burde enten være en egen modul eller lag til i devshells egentlig
      pkgs.clang-tools
      pkgs.bear

      selfpkgs.myGit
      selfpkgs.myFastfetch
    ];

    programs.tmux = {
      enable = true;
      clock24 = true;
      baseIndex = 1;
      mouse = true;
      shell = "${pkgs.zsh}/bin/zsh";
      prefix = "C-space";
    };

    programs.nix-your-shell = {
      enable = true;
      enableZshIntegration = true;
      nix-output-monitor.enable = true;
    };

    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.eza = {
      enable = true;
      enableZshIntegration = true;
      icons = "auto";
      git = true;
    };
  };
}
