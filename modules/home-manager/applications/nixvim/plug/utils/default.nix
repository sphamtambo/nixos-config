{...}: {
  imports =
    [(import ./comment-nvim.nix)]
    # ++ [(import ./copilot.nix)]
    ++ [(import ./flash.nix)]
    ++ [(import ./grapple.nix)]
    ++ [(import ./hardtime.nix)]
    ++ [(import ./harpoon.nix)]
    ++ [(import ./illuminate.nix)]
    ++ [(import ./markdown-preview.nix)]
    ++ [(import ./neotest.nix)]
    ++ [(import ./nvim-autopairs.nix)]
    ++ [(import ./nvim-surround.nix)]
    ++ [(import ./nvim-web-devicons.nix)]
    ++ [(import ./oil.nix)]
    ++ [(import ./plenary.nix)]
    ++ [(import ./tmx-navigator.nix)]
    ++ [(import ./toggleterm.nix)]
    ++ [(import ./ufo.nix)]
    ++ [(import ./undotree.nix)]
    ++ [(import ./whichkey.nix)];
}
