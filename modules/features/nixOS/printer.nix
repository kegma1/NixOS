{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.printer = {pkgs, ...}: {
    services.printing = {
      enable = true;
      drivers = with pkgs; [gutenprint hplip splix cups-filters cups-browsed];
    };
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
