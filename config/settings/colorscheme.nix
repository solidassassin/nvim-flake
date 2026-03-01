{
  highlightOverride = {
    "@comment.todo" = {
      fg = "#f9e2af";
      bold = true;
    };
  };

  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      term_colors = true;
      transparent_background = false;

      color_overrides = {
        mocha = {
          base = "#000000";
          mantle = "#000000";
          crust = "#000000";
        };
      };

      integrations = {
        barbar = true;
        blink_cmp = {
          style = "bordered";
        };
        blink_indent = true;
        blink_pairs = true;
        flash = true;
        gitsigns = true;
        markview = true;
        treesitter = true;
        notify = true;
        noice = true;
        snacks = {
          enabled = true;
          indent_scope_color = "";
        };
        which_key = true;
      };
    };
  };
}
