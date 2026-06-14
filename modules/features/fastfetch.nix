
{ self, inputs, ... }: {
  flake.nixosModules.fastfetch= {pkgs, ...}: {
    environment.systemPackages= [self.packages.${pkgs.stdenv.hostPlatform.system}.myFastfetch];
  };
  perSystem = { pkgs, ... }: {
    packages.myFastfetch = inputs.wrapper-modules.wrappers.fastfetch.wrap {
      inherit pkgs;
      settings = {
        logo = {
          source = "~/NixOS/ralsei.png";
        };
        modules = [
          {
            type = "os";
            key = "";
          }
          "uptime"
          {
            type = "command";
            key = "OS Age";
            text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
          }
        ];
      };
    };
  };
}
