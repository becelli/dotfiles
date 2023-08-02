return {
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
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
			"zbirenbaum/copilot-cmp",
		},
		-- override the options table that is used in the `require("cmp").setup()` call
		opts = function(_, opts)
			-- opts parameter is the default options table
			-- the function is lazy loaded so cmp is able to be required
			local cmp = require("cmp")
			-- modify the sources part of the options table
			opts.sources = cmp.config.sources({

				{ name = "copilot", priority = 1000 },
				{ name = "nvim_lsp", priority = 999 },
				{ name = "luasnip", priority = 750 },
				{ name = "path", priority = 500 },
				{ name = "buffer", priority = 400 },
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

			local menu_icon = {
				copilot = "",
				nvim_lsp = "",
				luasnip = "",
				buffer = "",
				path = "",
				emoji = "󰞅",
			}
			opts.formatting = {
				fields = { "menu", "abbr", "kind" },
				format = function(entry, item)
					item.menu = menu_icon[entry.source.name]

					if entry.source.name == "nvim_lsp" then
						item.kind = require("lspkind").presets.default[item.kind] .. " " .. item.kind
					elseif entry.source.name == "copilot" then
						item.kind = "" .. " " .. item.kind
					end

					return item
				end,
			}

			return opts
		end,
	},
}
