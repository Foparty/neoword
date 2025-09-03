return {

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      explorer = {
        replace_netrw = true,
      },
      picker = {

        sources = {
          explorer = {
            auto_close = true,
          },
        },
      },
    },

    keys = {
      {
        "<C-e>",
        function()
          Snacks.explorer()
        end,
        desc = "Explorer Toggle",
      },
    },

  },
}
