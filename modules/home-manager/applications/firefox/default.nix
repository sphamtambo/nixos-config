{config, ...}: {
  programs.firefox = {
    enable = true;
    profiles = {
      user = {
        name = "user";
        bookmarks = {};
        settings = {
          "browser.tabs.tabMinWidth" = 16;
          "identity.fxaccounts.enabled" = false;
          "privacy.trackingprotection.enabled" = true;
          "dom.security.https_only_mode" = true;
          # "signon.rememberSignons" = false;
          "browser.shell.checkDefaultBrowser" = false;
          "browser.shell.defaultBrowserCheckCount" = 1;
          "browser.disableResetPrompt" = true;
        };

        # Search firefox extension
        #https://nur.nix-community.org/repos/rycee/
        extensions = with config.nur.repos.rycee.firefox-addons; [
          behind-the-overlay-revival # Block overlay mask
          browserpass # GPG passwordstore
          darkreader # Dark mode
          floccus # Sync bookmark
          onepassword-password-manager # Password manager
          simple-tab-groups # Tab group
          simple-translate # Translate
          tomato-clock # Pomodoro timer
          ublock-origin # addblocker
          # resurrect # resotore accidentally closed tabs
        ];
      };
    };
  };
}
