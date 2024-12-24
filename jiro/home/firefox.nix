{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        isDefault = true;
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          bitwarden
          ublock-origin
          privacy-badger
          clearurls
          decentraleyes
          multi-account-containers
          duckduckgo-privacy-essentials
        ];
        settings = {
          "privacy.donottrackheader.enabled" = true;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
          "browser.contentblocking.report.lockwise.enabled" = false;
        };
      };
    };
  };
}
