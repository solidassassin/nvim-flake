{
  plugins.friendly-snippets.enable = true;
  plugins.blink-pairs.enable = true;
  plugins.blink-cmp = {
    enable = true;
    settings = {
      completion = {
        documentation = {
          auto_show = true;
        };
      };
      keymap = {
        preset = "enter";
        "<Tab>" = [
          {
            __raw = ''
              function(cmp)
                if #cmp.get_items() == 1 then
                  return cmp.accept()
                end
              end
            '';
          }
          "select_next"
          "fallback"
        ];
        "<S-Tab>" = [
          "select_prev"
          "fallback"
        ];
      };
    };
  };
}
