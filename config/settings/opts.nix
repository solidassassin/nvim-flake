{ lib, ... }:
{
  opts = {
    number = true;
    relativenumber = true;
    ignorecase = true;
    termguicolors = true;
    clipboard = "unnamedplus";
    foldlevel = 99;
    foldlevelstart = 99;
    shiftwidth = 2;
    tabstop = 2;
    expandtab = true;
    smartindent = false;
    cindent = false;
    autoindent = true;
    inccommand = "split";
  };

  filetype.extension = {
    tpl = "helm";
    yaml = lib.nixvim.mkRaw ''
      function(path, bufnr)
        if path:match('/templates/') then
          local chart_root = vim.fs.find('Chart.yaml', {
            path = vim.fs.dirname(path),
            upward = true,
            stop = vim.env.HOME
          })

          if #chart_root > 0 then
            return 'helm'
          end
        end

        return 'yaml'
      end
    '';
  };
}
