{...}: {
  imports =
    [(import ./lualine.nix)]
    ++ [(import ./staline.nix)];
}
