{ pkgs, lib, ... }:
{
  lsp = {
    servers = {
      gopls.enable = true;
      rust_analyzer.enable = true;
      zls.enable = true;
      terraformls.enable = true;
      helm_ls.enable = true;
      bashls.enable = true;
      basedpyright.enable = true;
      nixd = {
        enable = true;
        config = {
          formatting = {
            command = [ "nixfmt" ];
          };
        };
      };
      marksman.enable = true;
      yamlls.enable = true;
      jsonls.enable = true;
      gitlab_ci_ls.enable = true;
      docker_language_server.enable = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>f";
        action = lib.nixvim.mkRaw "function() vim.lsp.buf.format() end";
        options.desc = "Format code";
      }
      {
        mode = "n";
        key = "<leader>g";
        action = lib.nixvim.mkRaw "function() Snacks.picker.lsp_definitions() end";
        options.desc = "Go to definition";
      }
      {
        mode = "n";
        key = "<leader>d";
        action = lib.nixvim.mkRaw "function() Snacks.picker.diagnostics() end";
        options.desc = "Search diagnostics";
      }
      {
        mode = "n";
        key = "<C-d>";
        action = "<cmd>Trouble diagnostics toggle<CR>";
        options.desc = "Toggle diagnostics window (Trouble)";
      }
      {
        mode = "n";
        key = "<leader>a";
        lspBufAction = "code_action";
        options.desc = "Code Actions";
      }
    ];
  };

  extraPackages = with pkgs; [
    nixfmt
  ];
}
