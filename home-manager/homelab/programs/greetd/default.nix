{pkgs, ...}: {
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        user = "sphalo";
        command = "$SHELL -l";
      };
    };
  };
}
