return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup()
    end,
  },
  {
    "eddyekofo94/gruvbox-flat.nvim",
    config = function()
      -- vim.o.background = "dark"
      vim.g.gruvbox_flat_style = "hard"
    end,
  },
}
