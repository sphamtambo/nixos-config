{
  programs.nixvim.plugins = {
    alpha = {
      enable = true;
      layout = [
        {
          type = "padding";
          val = 2;
        }
        {
          type = "text";
          val = [
            "                                                                     "
            "       ████ ██████           █████      ██                     "
            "      ███████████             █████                             "
            "      █████████ ███████████████████ ███   ███████████   "
            "     █████████  ███    █████████████ █████ ██████████████   "
            "    █████████ ██████████ █████████ █████ █████ ████ █████   "
            "  ███████████ ███    ███ █████████ █████ █████ ████ █████  "
            " ██████  █████████████████████ ████ █████ █████ ████ ██████ "
            "                                                                       "
          ];
          opts = {
            position = "center";
            hl = "Type";
          };
        }
        {
          type = "padding";
          val = 2;
        }
        {
          opts = {
            hl = "AlphaButtons";
            position = "center";
            spacing = 1;
          };
          type = "group";
          val = let
            mkButton = shortcut: cmd: val: {
              type = "button";
              inherit val;
              on_press.raw = "funcion() vim.cmd[[${cmd}]] end";
              opts = {
                keymap = [
                  "n"
                  shortcut
                  cmd
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                inherit shortcut;
                position = "center";
                cursor = 3;
                width = 40;
                align_shortcut = "right";
                hl = "AlphaButtons";
              };
            };
          in [
            (
              mkButton
              "f"
              "<CMD>lua require('telescope.builtin').find_files({hidden = true})<CR>"
              "󰈞  Find file"
            )
            (
              mkButton
              "n"
              "<CMD>edit new_file<CR>"
              "  New file"
            )
            (
              mkButton
              "o"
              "<CMD>lua require('telescope.builtin').oldfiles({hidden = true})<CR>"
              "󰊄  Recently used files"
            )
            (
              mkButton
              "r"
              "<CMD>lua require('telescope.builtin').live_grep({hidden = true})<CR>"
              "󰈬  Live grep"
            )
            (
              mkButton
              "c"
              "<CMD>edit ~/nix-config/flake.nix<CR>"
              "  Configuration"
            )
            (
              mkButton
              "q"
              "<CMD>qa<CR>"
              "󰅚  Quit Neovim"
            )
          ];
        }
        {
          type = "padding";
          val = 2;
        }
      ];
    };
  };
}
