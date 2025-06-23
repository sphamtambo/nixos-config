{...}: {
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;

    shellAliases = {
      fd = "cd $(find * -type d | fzf --reverse)";
      fp = "fzf --height=85% --reverse --preview 'bat --style=numbers --color=always --line-range :500 {}'";
      fv = "fzf --height=85% --reverse --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs nvim";

      cat = "bat";
      ls = "lsd";

      # l. = "ls -d .*";
      l = "ls -l";
      ll = "ls -alF";
      la = "ls -A";
      lh = "ls -lAF";
      lt = "lsd -AF --tree";
      ld = "ls -d */";

      rm = "rm -i";
      cp = "cp -i";
      mv = "mv -i";

      vi = "vi";
      vim = "nvim";

      # Git aliases
      ga = "git add";
      gc = "git commit";
      gcm = "git commit -m";
      gs = "git status";
      gd = "git diff";
      gl = "git log";
      gb = "git branch";
      gco = "git checkout";
      gm = "git merge";
      gcl = "git clone";
      gpull = "git pull";
      gpush = "git push";
      grb = "git rebase";
      gtag = "git tag";
      gfetch = "git fetch";
      gch = "git checkout";
      gclean = "git clean -fd";
      greset = "git reset";
      gsh = "git show";
      gstash = "git stash";

      nvimrc = "cd ~/.config/nvim/ && vim";
      zshrc = "vim ~/.zshrc";

      grep = "grep --color=auto";
      fgrep = "fgrep --color=auto";
      egrep = "egrep --color=auto";

      open = "xdg-open";

      ds2020 = "$HOME/sofwares/BIOVIA2020/DiscoveryStudio2020/bin/DiscoveryStudio2020";
      mzmine = "$HOME/sofwares/bin/mzmine";
      pymol = "$HOME/miniforge3/bin/pymol";
    };

    initExtra = ''
         # History settings
         		HISTSIZE=1000
         		SAVEHIST=1000
         		HISTFILE=~/.zsh_history
         		setopt INC_APPEND_HISTORY    # Immediately append commands to history file.
         		setopt HIST_IGNORE_ALL_DUPS  # Never add duplicate entries.
         		setopt HIST_IGNORE_SPACE     # Ignore commands that start with a space.
         		setopt HIST_REDUCE_BLANKS    # Remove unnecessary blank lines.

         # Use modern completion system
         		autoload -Uz compinit
         		compinit
         		_comp_options+=(globdots)    # include hidden files

         # Use vi keybindings
         		bindkey -v
         		bindkey "^F" vi-cmd-mode

         # handy keybindings
         		bindkey "^A" beginning-of-line
         		bindkey "^E" end-of-line
         		bindkey "^B" backward-word
         		bindkey "^D" delete-word
         		bindkey "^K" kill-line
         		# bindkey "^R" history-incremental-search-backward
         		# bindkey "^P" history-search-backward
         		bindkey "^Y" accept-and-hold
         		bindkey "^N" insert-last-word
         		bindkey "^Q" push-line-or-edit
         		bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

         # >>> conda initialize >>>
         # !! Contents within this block are managed by 'conda init' !!
           __conda_setup="$('$HOME/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
           if [ $? -eq 0 ]; then
               eval "$__conda_setup"
           else
               if [ -f "$HOME/miniforge3/etc/profile.d/conda.sh" ]; then
                   . "$HOME/miniforge3/etc/profile.d/conda.sh"
               else
                   export PATH="$HOME/miniforge3/bin:$PATH"
               fi
           fi
           unset __conda_setup
           if [ -f "$HOME/miniforge3/etc/profile.d/mamba.sh" ]; then
               . "$HOME/miniforge3/etc/profile.d/mamba.sh"
           fi
         # <<< conda initialize <<<

         # >>> mamba initialize >>>
         # !! Contents within this block are managed by 'mamba shell init' !!
           export MAMBA_EXE='$HOME/miniforge3/bin/mamba';
           export MAMBA_ROOT_PREFIX='$HOME/miniforge3';
           __mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
           if [ $? -eq 0 ]; then
               eval "$__mamba_setup"
           else
               export PATH="$MAMBA_ROOT_PREFIX/bin:$PATH"
           fi
           unset __mamba_setup

         # <<< mamba initialize <<<

         # Source MGLtools
         source /home/sphalo/sofwares/mgltools/initMGLtools.sh

         export PATH="$HOME/.local/bin":$PATH
         export PATH="$HOME/bin":$PATH

         # clang 12 directory to the path variable
         export PATH=/usr/lib/llvm-16/bin:$PATH
         export PATH="/usr/bin:/usr/local/bin:$PATH"
         export PATH="/usr/bin:/usr/local/bin:/usr/local/clang-16/bin:$PATH"
         export PATH="/usr/bin:$PATH"

         # mysql
         export PATH="/usr/local/mysql/bin:$PATH"

         # mysql workbench
         export PATH=$PATH:/snap/bin

         # Chimera
         export PATH="$PATH:$HOME/.local/UCSF-Chimera64-1.17.3/bin:$PATH"

         # DiscoveryStudio2020
         export PATH="$HOME/sofwares/BIOVIA2020/DiscoveryStudio2020/bin:$PATH"
         export LD_LIBRARY_PATH="$HOME/sofwares/BIOVIA2020/LicensePack/linux/lib:$LD_LIBRARY_PATH"

         # sirius
         export PATH="$HOME/opt/sirius/sirius/bin:$PATH"

      export PATH="$HOME/.nix-profile/bin:$PATH"

    '';
    plugins = [
      {
        name = "zsh-syntax-highlighting";
        file = "zsh-syntax-highlighting.zsh";
        src = builtins.fetchGit {
          url = "https://github.com/zsh-users/zsh-syntax-highlighting/";
          rev = "e0165eaa730dd0fa321a6a6de74f092fe87630b0";
        };
      }

      {
        name = "zsh-autosuggestions";
        file = "zsh-autosuggestions.zsh";
        src = builtins.fetchGit {
          url = "https://github.com/zsh-users/zsh-autosuggestions/";
          rev = "c3d4e576c9c86eac62884bd47c01f6faed043fc5";
        };
      }

      {
        name = "zoxide";
        file = "zoxide.zsh";
        src = builtins.fetchGit {
          url = "https://github.com/ajeetdsouza/zoxide/";
          rev = "5b2c9222f9737a828438b487d9d8fd37f5bba81b";
        };
      }
    ];
  };
}
