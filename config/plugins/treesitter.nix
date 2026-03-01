{ pkgs, ... }:
{
  plugins.ts-comments.enable = true;
  plugins.treesitter = {
    enable = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    settings = {
      highlight.enable = true;
      indent.enable = true;
      incremental_selection.enable = true;
    };
  };

  autoCmd = [
    {
      event = [ "FileType" ];
      pattern = "*";
      callback = {
        __raw = ''
          function()
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            vim.wo[0][0].foldmethod = 'expr'
            vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          end
        '';
      };
    }
  ];
}
