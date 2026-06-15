{ self, inputs, ... }: {
  flake.nixosModules.oh-my-posh = {pkgs, ...}: {
  };
  perSystem = { pkgs, ... }: {
    packages.myOh-my-posh= inputs.wrapper-modules.wrappers.oh-my-posh.wrap {
      inherit pkgs;
      settings = {
      };
    };
  };
}
