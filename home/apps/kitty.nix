{ pkgs, ... }:

{
  home.packages = [
    pkgs.nerd-fonts.fira-mono
  ];

  fonts.fontconfig.enable = true;

  programs.kitty = {
    enable = true;

    font = {
      name = "FiraMono Nerd Font Mono";
      size = 12;
    };

    themeFile = "Afterglow";

    keybindings = {
      "alt+left" = "send_text all \\x1b\\x62";
      "alt+right" = "send_text all \\x1b\\x66";

      "ctrl+shift+l" = "next_layout";
      "ctrl+alt+t" = "goto_layout tall";
      "ctrl+alt+f" = "goto_layout fat";
      "ctrl+alt+s" = "goto_layout splits";
      "ctrl+alt+p" = "last_used_layout";

      "kitty_mod+o" = "launch --location=hsplit --cwd=current";
      "kitty_mod+g" = "launch --location=vsplit --cwd=current";

      "shift+up" = "move_window up";
      "shift+left" = "move_window left";
      "shift+right" = "move_window right";
      "shift+down" = "move_window down";

      "alt+shift+h" = "neighboring_window left";
      "alt+shift+l" = "neighboring_window right";
      "alt+shift+j" = "neighboring_window down";
      "alt+shift+k" = "neighboring_window up";
      "alt+shift+p" = "nth_window -1";

      "kitty_mod+0" = "change_font_size all +1.0";
      "kitty_mod+9" = "change_font_size all -1.0";
      "kitty_mod+backspace" = "change_font_size all 0";
      "kitty_mod+f" = "toggle_fullscreen";

      "kitty_mod+1" = "goto_tab 1";
      "kitty_mod+2" = "goto_tab 2";
      "kitty_mod+3" = "goto_tab 3";
      "kitty_mod+4" = "goto_tab 4";
      "kitty_mod+5" = "goto_tab 5";
      "kitty_mod+6" = "goto_tab 6";
      "kitty_mod+7" = "goto_tab 7";
      "kitty_mod+8" = "goto_tab 8";
      "kitty_mod+l" = "next_tab";
      "kitty_mod+h" = "previous_tab";
      "kitty_mod+t" = "new_tab_with_cwd";
      "kitty_mod+q" = "close_tab";
    };

    settings = {
      symbol_map = "U+e000-U+e00a,U+ea60-U+ebeb,U+e0a0-U+e0c8,U+e0ca,U+e0cc-U+e0d4,U+e200-U+e2a9,U+e300-U+e3e3,U+e5fa-U+e6b1,U+e700-U+e7c5,U+f000-U+f2e0,U+f300-U+f372,U+f400-U+f532,U+f0001-U+f1af0 Symbols Nerd Font Mono";

      cursor_shape = "block";
      cursor_blink_interval = 0;

      url_style = "double";
      strip_trailing_spaces = "smart";

      enable_audio_bell = false;
      visual_bell_duration = 0.0;
      window_alert_on_bell = false;
      bell_on_tab = false;

      hide_window_decorations = "yes";
      enabled_layouts = "Tall,Splits,Fat";

      inactive_text_alpha = "0.7";
      window_border_width = "0.9";
      window_margin_width = "0.5";
      draw_minimal_borders = "no";
      remember_window_size = "yes";

      sync_to_monitor = "yes";

      kitty_mod = "ctrl+shift";

      tab_bar_style = "separator";
      tab_title_template = "\"{index}: {title} [{num_windows}]\"";
      active_tab_title_template = "\"{title}\"";
      tab_separator = "\" | \"";
    };
  };
}
