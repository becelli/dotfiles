return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {},
		opts = function(_, opts)
			local cmp = require("cmp")
			opts.sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 999 },
				-- { name = "luasnip", priority = 750 },
				-- { name = "path", priority = 500 },
				-- { name = "buffer", priority = 400 },
				-- { name = "emoji", priority = 300 },
			})

			local menu_icon = {
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
					end

					return item
				end,
			}

			return opts
		end,
	},
}
