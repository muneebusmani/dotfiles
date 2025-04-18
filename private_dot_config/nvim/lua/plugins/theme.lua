return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 10000000,
    lazy = false,
    opts = {
      transparent_background = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
