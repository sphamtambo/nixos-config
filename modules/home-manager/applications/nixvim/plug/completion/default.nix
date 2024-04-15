{...}: {
  imports =
    [(import ./cmp.nix)]
    ++ [(import ./copilot-cmp.nix)]
    ++ [(import ./lspkind.nix)];
}
