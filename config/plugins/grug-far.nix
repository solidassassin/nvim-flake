{ pkgs, lib, ... }:
{
  plugins.grug-far = {
    enable = true;
    settings = {
      transient = true;
      keymaps = {
        close = {
          n = "<Esc>";
        };
      };
    };
  };

  extraPackages = with pkgs; [
    ripgrep
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>r";
      action = lib.nixvim.mkRaw "function() require('grug-far').open({ prefills = { paths = vim.fn.expand('%') } }) end";
      options = {
        desc = "Find and replace in current file";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>R";
      action = lib.nixvim.mkRaw "function() require('grug-far').open() end";
      options = {
        desc = "Find and replace";
        silent = true;
      };
    }
    {
      mode = "v";
      key = "<leader>r";
      action = lib.nixvim.mkRaw "function() require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand('%') } }) end";
      options = {
        desc = "Replace selection in current file";
        silent = true;
      };
    }
    {
      mode = "v";
      key = "<leader>R";
      action = lib.nixvim.mkRaw "function() require('grug-far').with_visual_selection() end";
      options = {
        desc = "Replace selection";
        silent = true;
      };
    }
  ];
}
