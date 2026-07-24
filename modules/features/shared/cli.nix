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
      pkgs.zip
      pkgs.unzip

      # programming shii, burde enten være en egen modul eller lag til i devshells egentlig
      pkgs.clang-tools

      selfpkgs.myGit
      selfpkgs.myFastfetch
    ];

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
