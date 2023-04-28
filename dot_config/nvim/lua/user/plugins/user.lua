return {
  {
    "eddyekofo94/gruvbox-flat.nvim",
    config = function()
      vim.o.background = "dark"
      vim.g.gruvbox_flat_style = "hard"
    end,
  },
  {
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup({})
    end,
  },
}
