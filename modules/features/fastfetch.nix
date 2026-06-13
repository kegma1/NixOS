
{ self, inputs, ... }: {
  flake.nixosModules.fastfetch= {pkgs, ...}: {
    environment.systemPackages= [self.packages.${pkgs.stdenv.hostPlatform.system}.myFastfetch];
  };
  perSystem = { pkgs, ... }: {
    packages.myFastfetch = inputs.wrapper-modules.wrappers.fastfetch.wrap {
      inherit pkgs;
      settings = {
        modules = [
          "os"
          "uptime"
        ];
      };
    };
  };
}
