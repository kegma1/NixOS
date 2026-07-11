{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.appimage = {pkgs, ...}: {
    programs.appimage.enable = true;
    programs.appimage.binfmt = true;

    environment.systemPackages = with pkgs; [
      gearlever
    ];
  };
}
