{ self, inputs, ... }: {
  perSystem = { pkgs, ... }: {
    packages.myFuzzel = inputs.wrapper-modules.wrappers.fuzzel.wrap {
      inherit pkgs;
    };  
  };
}
