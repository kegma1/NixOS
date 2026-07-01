{ self, inputs, ... }: {
  perSystem = { pkgs, ... }: {
    packages.myGit = inputs.wrapper-modules.wrappers.git.wrap {
      inherit pkgs;
      settings = {
        user = {
          name  = "Kennet Mathisen";
          email = "kennetam02@gmail.com";
        };
        init.defaultBranch = "main";
      };
    };
  };
}
