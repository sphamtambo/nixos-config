{...}: {
  imports =
    [(import ./gitlinker.nix)]
    ++ [(import ./gitsigns.nix)]
    ++ [(import ./lazygit.nix)]
    ++ [(import ./worktree.nix)];
}
