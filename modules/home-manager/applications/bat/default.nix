{inputs, ...}: {
  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
      theme = "dracula";
      colort = "always";
    };
  };
}
