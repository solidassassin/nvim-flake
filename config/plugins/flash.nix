{ lib, ... }:
{
  plugins.flash = {
    enable = true;
  };

  keymaps = [
    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "f";
      action = lib.nixvim.mkRaw "function() require('flash').jump() end";
      options.desc = "Jump around with Flash";
    }
  ];
}
