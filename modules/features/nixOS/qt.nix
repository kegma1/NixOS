{ lib, ... }: {
  flake.nixosModules.qt = {...}: {
    qt.platformTheme = lib.mkForce "gnome";
    stylix.targets.qt.platform = lib.mkForce "qtct";
  };
}
