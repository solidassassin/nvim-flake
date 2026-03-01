{ pkgs, ... }:
{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft.markdown = [ "prettier" ];
    };
  };

  extraPackages = with pkgs; [
    nodePackages.prettier
  ];
}
