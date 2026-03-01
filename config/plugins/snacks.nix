{ pkgs, lib, ... }:
{
  plugins.snacks = {
    enable = true;
    settings = {
      explorer = {
        enabled = true;
        replace_netrw = true;
      };
      input.enabled = true;
      select.enabled = true;
      notifier.enabled = true;
      picker.enabled = true;
      dashboard = {
        enabled = true;
        sections = [
          { section = "header"; }
          {
            icon = " ";
            title = "Keymaps";
            section = "keys";
            indent = 2;
            padding = 1;
          }
          {
            icon = " ";
            title = "Recent Files";
            section = "recent_files";
            indent = 2;
            padding = 1;
          }
          {
            icon = " ";
            title = "Projects";
            section = "projects";
            indent = 2;
            padding = 1;
          }
        ];
      };
      bigfile.enabled = true;
      words.enabled = true;
      indent.enabled = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<C-p>";
      action = lib.nixvim.mkRaw "function() Snacks.picker() end";
      options.desc = "Open the Snacks picker menu";
    }
    {
      mode = [
        "n"
        "t"
      ];
      key = "<C-t>";
      action = lib.nixvim.mkRaw "function() Snacks.terminal.toggle() end";
      options.desc = "Toggle terminal";
    }
    {
      mode = "n";
      key = "<leader>s";
      action = lib.nixvim.mkRaw "function() Snacks.picker.lines() end";
      options.desc = "Search within the current file";
    }
    {
      mode = "n";
      key = "<leader>S";
      action = lib.nixvim.mkRaw "function() Snacks.picker.grep() end";
      options.desc = "Search within the entire project";
    }
    {
      mode = "n";
      key = "<C-e>";
      action = lib.nixvim.mkRaw "function() Snacks.picker.explorer() end";
      options.desc = "Toggle file explorer";
    }
  ];

  extraPackages = [
    pkgs.fd
  ];
}
