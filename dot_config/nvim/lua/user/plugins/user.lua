return {
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
		-- override nvim-cmp plugin
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-emoji", -- add cmp source as dependency of cmp
		},
		-- override the options table that is used in the `require("cmp").setup()` call
		opts = function(_, opts)
			-- opts parameter is the default options table
			-- the function is lazy loaded so cmp is able to be required
			local cmp = require("cmp")
			-- modify the sources part of the options table
			opts.sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 1000 },
				{ name = "luasnip", priority = 750 },
				{ name = "buffer", priority = 300 },
				{ name = "path", priority = 200 },
				{ name = "emoji", priority = 300 },
			})

			-- add the category of the item (function, variable, etc.) to the completion menu
			-- opts.formatting = {
			-- 	format = function(entry, vim_item)
			-- 		vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
			-- 		vim_item.menu = ({
			-- 			nvim_lsp = "[LSP]",
			-- 			luasnip = "[LuaSnip]",
			-- 			buffer = "[Buffer]",
			-- 			path = "[Path]",
			-- 			emoji = "[Emoji]",
			-- 		})[entry.source.name]
			-- 		return vim_item
			-- 	end,
			-- }

			opts.formatting = {
				fields = { "menu", "abbr", "kind" },
				format = function(entry, item)
					local menu_icon = {
						nvim_lsp = "",
						luasnip = "",
						buffer = "",
						path = "",
					}
					item.menu = menu_icon[entry.source.name]
					return item
				end,
			}

			return opts
		end,
	},
}
