{ lib, self, inputs,  ... }: {
  flake.homeModules.zsh = { pkgs,  ... }: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in  {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    
    programs.zsh = {
      enable = true;

       history = {
        path = "$HOME/.zsh_history";
        size = 10000;
        save = 10000;
        share = true;
        ignoreDups = true;
        ignoreSpace = true;
      };

      shellAliases = {
        ls = "eza";
        ll = "ls -lh";
        la = "ls -A";
        l = "ls -CF";
        h = "hx .";
        lg = "lazygit";
      };

      initContent = ''
        setopt AUTO_CD
        setopt INTERACTIVE_COMMENTS
        setopt APPEND_HISTORY

        bindkey -e

        autoload -Uz compinit
        compinit

        zstyle ':completion:*' menu select
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

        emulate -R zsh

        autoload -Uz colors
        colors

        export PAGER=less

        if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
          eval "$(${lib.getExe selfpkgs.myOh-my-posh} init zsh)"
        fi
      '';
      
    };
  };
}
