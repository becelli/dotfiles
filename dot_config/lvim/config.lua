vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = true
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
lvim.keys.normal_mode["<S-h>"] = ":bprev<cr>"
lvim.keys.normal_mode["<S-l>"] = ":bnext<cr>"
lvim.keys.normal_mode["|"] = ":vsplit<CR>"
lvim.keys.normal_mode["-"] = ":split<CR>"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.treesitter.auto_install = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "cpp",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "rust",
  "java",
  "yaml",
  "toml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

lvim.plugins = {
  { "github/copilot.vim" },
  -- { "machakann/vim-sandwich" },
  --{ "christoomey/vim-tmux-navigator" },
  -- { "lunarvim/colorschemes" },
  -- { "folke/zen-mode.nvim" },
  -- { "folke/lsp-colors.nvim" },
  -- { "folke/lsp-trouble.nvim" },
  -- { "Mofiqul/dracula.nvim" },
  -- { "nvim-lua/popup.nvim" },
  -- { "nvim-lua/plenary.nvim" },
  -- { "nvim-telescope/telescope.nvim" },
  -- { "nvim-telescope/telescope-media-files.nvim" },
  -- { "nvim-telescope/telescope-fzy-native.nvim" },
  -- { "nvim-telescope/telescope-frecency.nvim" },
  -- { "nvim-telescope/telescope-dap.nvim" },
  -- { "nvim-telescope/telescope-packer.nvim" },
  -- { "nvim-telescope/telescope-symbols.nvim" },
  -- { "nvim-telescope/telescope-github.nvim" },
  -- { "nvim-telescope/telescope-project.nvim" },
  -- { "nvim-telescope/telescope-arecibo.nvim" },
  -- { "nvim-telescope/telescope-z.nvim" },
  -- { "nvim-telescope/telescope-cheat.nvim" },
  -- { "nvim-telescope/telescope-ghq.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  -- { "p00f/nvim-ts-rainbow" },
  -- { "rmehri01/onenord.nvim" },
  -- { "sainnhe/everforest" },
  -- { "Mofiqul/dracula.nvim" },
}
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
local cmp = require "cmp"

lvim.builtin.cmp.mapping["<C-e>"] = function(fallback)
  cmp.mapping.abort()
  local copilot_keys = vim.fn["copilot#Accept"]()
  if copilot_keys ~= "" then
    vim.api.nvim_feedkeys(copilot_keys, "i", true)
  else
    fallback()
  end
end

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "stylua" },
  {
    command = "prettier",
    filetypes = { "typescript", "typescriptreact" },
  },
  {
    command = "black",
    filetypes = { "python" },
  }
}
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  {
    command = "shellcheck",
    args = { "--severity", "warning" },
  },
  -- mypy for python
  { command = "mypy",   filetypes = { "python" } },
}
