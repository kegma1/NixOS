{ lib, self, inputs, ... }: {
  flake.nixosModules.zsh = {pkgs, ...}: {
  };
  perSystem = { pkgs, self',  ... }: {
    packages.myZsh = inputs.wrapper-modules.wrappers.zsh.wrap {
      inherit pkgs;
      zshrc.content = ''
        # Emulate common bash behavior
        setopt AUTO_CD
        setopt INTERACTIVE_COMMENTS
        setopt HIST_IGNORE_DUPS
        setopt HIST_IGNORE_SPACE
        setopt SHARE_HISTORY
        setopt APPEND_HISTORY

        # Bash-style completion
        autoload -Uz compinit
        compinit

        # History
        HISTFILE=$HOME/.zsh_history
        HISTSIZE=10000
        SAVEHIST=10000

        # Key bindings similar to bash/readline
        bindkey -e

        # Completion behavior
        zstyle ':completion:*' menu select
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

        # Common aliases
        alias ll='ls -lh'
        alias la='ls -A'
        alias l='ls -CF'

        # Make zsh more POSIX/bash-like
        emulate -R zsh

        # Enable colors if available
        autoload -Uz colors
        colors

        export PAGER=less
        
        fastfetch
        
        # Prompt similar to many bash defaults
        # PROMPT='%n@%m:%~\$ '
        if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
          eval "$(${lib.getExe self'.packages.myOh-my-posh} init zsh)"
        fi
      '';
    };
  };
}
