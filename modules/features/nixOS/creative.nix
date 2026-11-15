{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.creative = {pkgs, ...}: {
    hardware.opentabletdriver.enable = true;
    environment.systemPackages = with pkgs; [
      kdePackages.kdenlive
      krita
      blender
      inkscape
    ];
  };
}
