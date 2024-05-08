{inputs, ...}: {
  programs.nixvim = {
    enable = true;
  };

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./keys.nix
    ./sets.nix
    ./highlight.nix

    ./plug/colorscheme
    ./plug/completion
    ./plug/debug
    ./plug/filetrees
    ./plug/git
    ./plug/lsp
    ./plug/snippets
    ./plug/statusline
    ./plug/telescope
    ./plug/treesitter
    ./plug/ui
    ./plug/utils
  ];
}
