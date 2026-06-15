{ self, inputs, ... }: {
  flake.nixosModules.oh-my-posh = {pkgs, ...}: {
  };
  perSystem = { pkgs, ... }: {
    packages.myOh-my-posh= inputs.wrapper-modules.wrappers.oh-my-posh.wrap {
      inherit pkgs;
      settings = {
        blocks = [
          {
            type = "prompt";
            alignment = "left";
            segments = [
              {
                type = "path";
                style = "plain";
                properties.style = "full";
                template = "{{ .Path }}";
              }
            ];
          }
          {
            type = "prompt";
            newline = true;
            alignment = "left";
            segments = [
              {
                type = "text";
                style = "plain";
                template = "  ";
              }
            ];
          }
        ];
      };
    };
  };
}
