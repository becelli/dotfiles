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
      require("tmux").setup({
        copy_sync = {
          enable = true,
          redirect_to_clipboard = true,
          sync_clipboard = true,
        },
        navigation = {
          enable_default_keybindings = true,
        },
        resize = {
          enable_default_keybindings = true,
        },
      })
    end,
  }
}
