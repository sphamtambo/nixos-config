{pkgs, ...}: {
  programs.zsh = {
    enable = true;

    # Enable syntax highlighting
    syntaxHighlighting = {
      enable = true;
    };

    # # Enable autosuggestions
    # autosuggestions = {
    #   enable = true;
    # };

    # Define shell aliases
    shellAliases = {
      jn = "jupyter notebook";
      jl = "jupyter lab";
      dsenv = "conda activate ds_env";

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

      nvimrc = "cd ~/.config/nvim/ && vim";
      zshrc = "vim ~/.zshrc";

      grep = "grep --color=auto";
      fgrep = "fgrep --color=auto";
      egrep = "egrep --color=auto";

      open = "xdg-open";

      ga = "git add";
      gc = "git commit";
      gco = "git checkout";
      gcp = "git cherry-pick";
      gdiff = "git diff";
      gl = "git prettylog";
      gp = "git push";
      gs = "git status";
      gt = "git tag";
    };
  };
}
