{...}: {
  imports =
    [(import ./hypr)]
    ++ [(import ./packages)]
    ++ [(import ./gtk)]
    ++ [(import ./cava)]
    ++ [(import ./mpd)];
}
