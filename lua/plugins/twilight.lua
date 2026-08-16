return {
  {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup({
        dimming = {
          alpha = 0.3,
          color = { "Normal", "#1a1a1a" },
          term_bg = "#f5f5f5",
          inactive = true,
        },
        context = 1,
        treesitter = true,
        expand = {
          "heading",
          "section",
          "paragraph",
          "list",
          "list_item",
        },
        exclude = {},
      })
    end,
  },
}
