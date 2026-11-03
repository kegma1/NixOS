{lib, ...}: {
  flake.nixosModules.qt = {...}: {
    qt.platformTheme = lib.mkForce "qt5ct";
    stylix.targets.qt.platform = lib.mkForce "qtct";
  };
}
