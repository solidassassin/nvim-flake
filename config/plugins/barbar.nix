{ lib, ... }:
{
  # Dependency
  plugins.web-devicons.enable = true;
  plugins.barbar = {
    enable = true;
  };

  keymaps =
    (map (n: {
      mode = "n";
      key = "<C-${toString n}>";
      action = "<Cmd>BufferGoto ${toString n}<CR>";
      options.desc = "Go to tab ${toString n}";
    }) (lib.range 1 9))

    ++ [
      {
        mode = "n";
        key = "<C-c>";
        action = "<Cmd>BufferClose<CR>";
        options.desc = "Close current tab";
      }
    ];
}
