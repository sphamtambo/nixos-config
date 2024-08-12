{
  inputs,
  username,
  ...
}: {
  imports =
    [(import ./btop)]
    ++ [(import ./packages)]
    ++ [(import ./alacritty)]
    ++ [(import ./firefox)]
    ++ [(import ./foot)]
    ++ [(import ./kitty)]
    ++ [(import ./zsh)]
    ++ [(import ./bash)]
    ++ [(import ./fzf)]
    # ++ [(import ./ranger)]
    ++ [(import ./git)]
    # ++ [(import ./nvim)]
    ++ [(import ./nixvim)]
    ++ [(import ./starship)]
    ++ [(import ./tmux)]
    # ++ [(import ./gaming)]
    ++ [(import ./dbeaver)]
    ++ [(import ./yazi)]
    ++ [(import ./zathura)]
    ++ [(import ./zoxide)];
}
