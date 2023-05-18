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
	{
		"sainnhe/gruvbox-material",
		enabled = true,
		priority = 1000,
		config = function()
			vim.o.background = "dark"
			vim.g.gruvbox_material_background = "hard"
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
	{
		"catppuccin/nvim",
		enabled = true,
		lazy = false,
		priority = 150,
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				background = {
					light = "latte",
					dark = "mocha",
				},
				styles = {
					comments = { "italic" },
					conditionals = {},
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
				transparent_background = false,
				show_end_of_buffer = false,
				custom_highlights = function(colors)
					return {
						NormalFloat = { bg = colors.crust },
						FloatBorder = { bg = colors.crust, fg = colors.crust },
						VertSplit = { bg = colors.base, fg = colors.surface0 },
						CursorLineNr = { fg = colors.mauve },
						Pmenu = { bg = colors.crust, fg = "" },
						PmenuSel = { bg = colors.surface0, fg = "" },
						TelescopeSelection = { bg = colors.surface0 },
						TelescopePromptCounter = { fg = colors.mauve },
						TelescopePromptPrefix = { bg = colors.surface0 },
						TelescopePromptNormal = { bg = colors.surface0 },
						TelescopeResultsNormal = { bg = colors.mantle },
						TelescopePreviewNormal = { bg = colors.crust },
						TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
						TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
						TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
						TelescopePromptTitle = { fg = colors.surface0, bg = colors.surface0 },
						TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
						TelescopePreviewTitle = { fg = colors.crust, bg = colors.crust },
						IndentBlanklineChar = { fg = colors.surface0 },
						IndentBlanklineContextChar = { fg = colors.surface2 },
						GitSignsChange = { fg = colors.peach },
						NvimTreeIndentMarker = { link = "IndentBlanklineChar" },
						NvimTreeExecFile = { fg = colors.text },
					}
				end,
			})

			vim.api.nvim_command("colorscheme catppuccin")
		end,
	},
}
