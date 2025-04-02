{pkgs, ...}: {
  programs.bash = {
    enable = true;

    # enableCompletion = {
    #   enable = true;
    # };

    # Define shell aliases
    shellAliases = {
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
      # orca = "~/Documents/DFT/orca/orca_6_0_1_linux_x86-64_shared_openmpi416";
      zshrc = "vim ~/.zshrc";
      grep = "grep --color=auto";
      fgrep = "fgrep --color=auto";
      egrep = "egrep --color=auto";
      open = "xdg-open";

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
    };
  };
}
