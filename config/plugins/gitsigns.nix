{
  plugins.gitsigns = {
    enable = true;
    settings = {
      current_line_blame = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gb";
      action = "<cmd>Gitsigns blame<CR>";
      options.desc = "Show Git blame";
    }
    {
      mode = "n";
      key = "<leader>gd";
      action = "<cmd>Gitsigns diffthis<CR>";
      options.desc = "Show Git diff";
    }
  ];
}
