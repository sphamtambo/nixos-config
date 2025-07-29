# { ... }:
# {
#   imports =
#     [ (import ./hypr) ]
#     ++ [ (import ./packages) ]
#     ++ [ (import ./gtk) ]
#     ++ [ (import ./cava) ]
#     ++ [ (import ./mpd) ];
# }

{ ... }:
{
  imports =
    [ (import ./fuzzel.nix) ]
    ++ [ (import ./packages) ]
    ++ [ (import ./hyprland.nix) ]
    ++ [ (import ./hyprlock.nix) ]
    ++ [ (import ./hyprpaper.nix) ]
    ++ [ (import ./swaync.nix) ]
    ++ [ (import ./waybar.nix) ]
    ++ [ (import ./wlogout.nix) ]
    ++ [ (import ./theme.nix) ];
}
