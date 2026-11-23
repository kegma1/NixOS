{
  lib,
  self,
  inputs,
  ...
}: {
  flake.homeModules.desktop = {
    pkgs,
    config,
    ...
  }: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in {
    imports = with self.homeModules; [
      kitty
      noctalia
      # waybar
      # fuzzel
      # wlogout
    ];
    home.packages = [
      pkgs.wl-clipboard
    ];

    programs.mpv.enable = true;
    xdg.enable = true;
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        # Images
        "image/avif" = [ "mpv.desktop" ];
        "image/bmp" = [ "mpv.desktop" ];
        "image/gif" = [ "mpv.desktop" ];
        "image/jpeg" = [ "mpv.desktop" ];
        "image/png" = [ "mpv.desktop" ];
        "image/svg+xml" = [ "mpv.desktop" ];
        "image/tiff" = [ "mpv.desktop" ];
        "image/webp" = [ "mpv.desktop" ];

        # Videos
        "video/mp4" = [ "mpv.desktop" ];
        "video/mpeg" = [ "mpv.desktop" ];
        "video/ogg" = [ "mpv.desktop" ];
        "video/webm" = [ "mpv.desktop" ];
        "video/x-matroska" = [ "mpv.desktop" ];
        "video/x-msvideo" = [ "mpv.desktop" ];
        "video/quicktime" = [ "mpv.desktop" ];
      };
    };
  };
}
