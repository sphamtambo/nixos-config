{pkgs, ...}: {
  home.packages = with pkgs; [
    poppler # pdf preview
    jq # json preview
    ueberzugpp # image preview
  ];

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      manager = {
        show_hidden = true;
        sort_dir_first = true;
      };
      opener = {
        edit = [
          {
            run = "nvim \"$@\"";
            desc = "$EDITOR";
            block = true;
            for = "unix";
          }
        ];
        open = [
          {
            run = "xdg-open \"$@\"";
            desc = "Open";
            for = "linux";
          }
        ];
      };
    };
  };
}
