return {
  {
    "jackplus-xyz/binary.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- Light paper colors; reversed automatically for dark.
      colors = {
        fg = "#1a1a1a",
        bg = "#f5f5f5",
      },
      reversed_group = {},
    },
    config = function(_, opts)
      require("binary").setup(opts)
      vim.cmd.colorscheme("binary")

      -- Quiet spell marks (iA Writer–like soft underlines)
      local function soft_ui()
        vim.api.nvim_set_hl(0, "SpellBad", { undercurl = true, sp = "#9a9a9a" })
        vim.api.nvim_set_hl(0, "SpellCap", { undercurl = true, sp = "#9a9a9a" })
        vim.api.nvim_set_hl(0, "SpellRare", { undercurl = true, sp = "#9a9a9a" })
        vim.api.nvim_set_hl(0, "SpellLocal", { undercurl = true, sp = "#9a9a9a" })
        local cursor = vim.o.background == "dark" and "#252525" or "#ebebeb"
        vim.api.nvim_set_hl(0, "CursorLine", { bg = cursor })
      end
      soft_ui()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "binary",
        callback = soft_ui,
      })
    end,
  },
  -- Kept available: :colorscheme tokyonight | zenbones
  { "folke/tokyonight.nvim", lazy = true },
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = true,
  },
}
