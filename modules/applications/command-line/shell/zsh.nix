{ pkgs, config, ... }:
{
  programs.zsh = {
    enable = true;
    # TODO replace .zshrc by home manager
    oh-my-zsh = {
      enable = true;
      theme = "";
      plugins = [ "macos" "git" "dotenv" ];
    };

    history = {
      size = 10000;
      ignoreAllDups = true;
      path = "$HOME/.zsh_history";
      append = true;
      ignorePatterns = [ "rm *" "pkill *" "cp *" "cd *" "ls *" ];
    };

    shellAliases = {
      la = "ls -a";
      cl = " clear";
      tree = "tree -a -I '.git'";
      ff = "fastfetch";
      ":wq" = "exit";
      zshconfig = "$EDITOR $HOME/.zshrc";
      reload = "source $HOME/.zshrc";
      myip = "curl http://ipecho.net/plain; echo";
      nix-shell = "nix-shell --run zsh";
    };

    autocd = true;

    # {{{ initContent
    initContent = ''
      setopt hist_ignore_space


      eval "$(zoxide init zsh --cmd cd)"

      eval "$(fzf --zsh)"
      autoload -U promptinit; promptinit

      PURE_PROMPT_SYMBOL=∮
      zstyle :prompt:pure:path color '#9ccfd8'
      zstyle :prompt:pure:prompt:success color '#c4a7e7'
      zstyle :prompt:pure:prompt:error color '#eb6f92'

      zstyle :prompt:pure:git:branch color '#ebbcba'
      zstyle :prompt:pure:git:dirty color '#ea9a97'
      zstyle :prompt:pure:git:stash show yes
      prompt pure

      if ! command -v matlab &> /dev/null; then
        alias matlab="/Applications/MATLAB_R2024b.app/bin/matlab"
      fi

      alias mat="matlab -nodesktop -nosplash"

      if command -v zoxide &> /dev/null; then
        eval "$(zoxide init zsh --cmd cd)"
      fi
      if command -v fzf &> /dev/null; then
        eval "$(fzf --zsh)"
      fi

    '';
    # }}}

    envExtra = ''
      # Editor Logic
      if [[ -n $SSH_CONNECTION ]]; then
        export EDITOR='vim'
      else
        export EDITOR='nvim'
      fi

      # PATH additions
      export PATH=$PATH:~/.spicetify
      export PATH=$PATH:~/.ghcup/bin
    '';
  };
}
