{
  enable = true;
  viAlias = true;
  vimAlias = true;

  # Options
  opts.number = true;
  opts.cc = "80";

  # Keymaps
  keymaps = [{
    key = "-";
    action = "<CMD>Oil<CR>";
  }];

  # Colorscheme
  colorschemes.onedark.enable = true;

  # File Navigation
  plugins.oil.enable = true;
}
