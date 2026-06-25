{ self, inputs, ... }: {
  flake.nixosModules.oh-my-posh = {pkgs, ...}: {
  };
  perSystem = { pkgs, ... }: {
    packages.myOh-my-posh= inputs.wrapper-modules.wrappers.oh-my-posh.wrap {
      inherit pkgs;
      settings = {
        transient_prompt = {
          template = " ";
        };
        blocks = [
          {
            type = "prompt";
            newline = true;
            alignment = "left";
            segments = [
              {
                type = "path";
                style = "plain";
                properties.style = "full";
                template = "{{ .Path }}";
              }
              {
                type = "git";
                
              }
            ];
          }
          {
            type = "prompt";
            alignment = "right";
            filler = ".";
            segments = [{
              type = "time";
            }];
          }
          {
            type = "prompt";
            newline = true;
            alignment = "left";
            segments = [
              {
                type = "text";
                style = "plain";
                template = "{{if eq .OS \"darwin\"}}  {{else}}  {{end}}";
              }
            ];
          }
        ];
      };
    };
  };
}
