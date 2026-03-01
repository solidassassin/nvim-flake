{
  globals = {
    mapleader = " ";
  };

  # These are keymaps which do not need any plugins or LSPs
  # Keymaps which are dependent on them are placed in the plugin configurations
  keymaps = [
    # Some alternative keymaps
    {
      mode = "n";
      key = "<C-Left>";
      action = "<C-w>h";
      options = {
        desc = "Jump to the Left Window";
        remap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-Right>";
      action = "<C-w>l";
      options = {
        desc = "Jump to the Right Window";
        remap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-Down>";
      action = "<C-w>j";
      options = {
        desc = "Jump to the Lower Window";
        remap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-Up>";
      action = "<C-w>k";
      options = {
        desc = "Jump to the Upper Window";
        remap = true;
        silent = true;
      };
    }
    {
      mode = "t";
      key = "<C-Left>";
      action = ''<C-\><C-n><C-w>h'';
      options = {
        desc = "Jump to the Left Window";
        remap = true;
        silent = true;
      };
    }
    {
      mode = "t";
      key = "<C-Right>";
      action = ''<C-\><C-n><C-w>l'';
      options = {
        desc = "Jump to the Right Window";
        remap = true;
        silent = true;
      };
    }
    {
      mode = "t";
      key = "<C-Down>";
      action = ''<C-\><C-n><C-w>j'';
      options = {
        desc = "Jump to the Lower Window";
        remap = true;
        silent = true;
      };
    }
    {
      mode = "t";
      key = "<C-Up>";
      action = ''<C-\><C-n><C-w>k'';
      options = {
        desc = "Jump to the Upper Window";
        remap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>c";
      action = "gcc";
      options = {
        desc = "Toggle comment on current line";
        remap = true;
        silent = true;
      };
    }
    {
      mode = "x";
      key = "<leader>c";
      action = "gc";
      options = {
        desc = "Toggle comment on selection";
        remap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>r";
      action = ":%s/";
      options.desc = "Find and replace";
    }
  ];
}
