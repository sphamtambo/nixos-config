{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    # newSession = true;
    prefix = "C-a";
    # shell = "${pkgs.zsh}/bin/zsh";
    baseIndex = 1;
    terminal = "tmux-256color";
    escapeTime = 0;
    clock24 = true;

    extraConfig = builtins.readFile ./tmux.conf;
    keyMode = "vi";
    plugins = with pkgs; [
      tmuxPlugins.prefix-highlight
      tmuxPlugins.sensible
      tmuxPlugins.yank
      {
        plugin = tmuxPlugins.dracula;
        extraConfig = ''
          set -g @dracula-show-left-icon session
          set -g @dracula-show-battery false
          set -g @dracula-show-powerline true
          set -g @dracula-refresh-rate 10
          set -g @dracula-show-location false
          set -g @dracula-show-fahrenheit false
          set -g @dracula-network-bandwidth-show-interface false
        '';
      }
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-strategy-vim 'session'
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-boot 'on'
          set -g @continuum-save-interval '5' # minutes
        '';
      }
      {
        plugin = tmuxPlugins.vim-tmux-navigator;
      }
    ];
  };
}
