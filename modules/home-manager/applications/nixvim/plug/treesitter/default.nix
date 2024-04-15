{...}: {
  imports =
    [(import ./treesitter-context.nix)]
    ++ [(import ./treesitter-textobjects.nix)]
    ++ [(import ./treesitter.nix)]
    ++ [(import ./ts-autotag.nix)];
}
