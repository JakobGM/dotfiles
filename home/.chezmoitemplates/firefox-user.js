// Firefox preferences, applied on every startup to both the main and the
// dropdown (scratchpad) profile. Extensions are installed via firefox-policies.json.

// Start fresh profiles on "System theme — auto", which follows the system
// light/dark setting (toggled from waybar). Firefox only honours this pref when
// creating a profile; afterwards the active theme lives in its add-on database.
user_pref("extensions.activeThemeID", "default-theme@mozilla.org");
// Don't let Firefox Sync override the theme with one from another device.
// Add-on sync is off since add-ons (and themes) are declared in firefox-policies.json.
user_pref("services.sync.prefs.sync.extensions.activeThemeID", false);
user_pref("services.sync.engine.addons", false);

// UI
{{- if eq .chezmoi.os "linux" }}
// Scale the UI and page content for the 4K monitors, which run at sway scale 1.
// macOS detects Retina scaling by itself.
user_pref("layout.css.devPixelsPerPx", "1.5");
{{- end }}
user_pref("browser.aboutConfig.showWarning", false);
user_pref("browser.bookmarks.showMobileBookmarks", false);
user_pref("browser.toolbars.bookmarks.visibility", "never");
user_pref("browser.urlbar.showSearchSuggestionsFirst", false);
user_pref("devtools.toolbox.host", "right");
user_pref("devtools.toolbox.zoomValue", "1.5");

// Passwords are handled by 1Password
user_pref("signon.rememberSignons", false);

// Privacy
user_pref("network.dns.disablePrefetch", true);
user_pref("network.prefetch-next", false);
user_pref("network.http.speculative-parallel-limit", 0);
user_pref("privacy.clearOnShutdown_v2.formdata", true);
