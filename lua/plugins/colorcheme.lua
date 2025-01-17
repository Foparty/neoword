return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require('catppuccin').setup({
				transparent_background = true,

			})
		end
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"jackplus-xyz/binary.nvim",
		opts = {
			-- type = "system", -- Theme style: "system" | "light" | "dark"
			colors = { -- Colors used for the "light" theme; reversed automatically for "dark"
				name = 'writer',
				-- ambar
				-- bg = '#ffb400'

				-- teal
				-- bg = '#00ca9e'

				-- sky
				-- fg = "#0049C6",
				-- bg = "#ffffff",

				-- wasteland
				-- fg = "#2CF180",
				-- bg = "#0E1F12",

				-- mcdonalds
				-- bg = "#FFBB14",
				-- fg = "#DB020B",

				-- ia writer light
				-- bg = '#1a1a1a',
				-- fg = '#cccccc',


				-- ia writer dark
				fg = '#1a1a1a',
				bg = '#cccccc'

			},
			reversed_group = {},
		}
	},
}
