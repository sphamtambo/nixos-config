{pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "sphamtambo";
    userEmail = "sphamtambo@gmail.com";

    extraConfig = {
      init.defaultBranch = "master";
      color.ui = true;
      core.editor = "nvim";
      credential.helper = "store";
      github.user = "sphamtambo";
      push.autoSetupRemote = true;
      help.autocorrect = 10;
    };
  };

  home.packages = [pkgs.gh pkgs.git-lfs];
}
