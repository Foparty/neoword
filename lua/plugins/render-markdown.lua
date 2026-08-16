return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      heading = {
        sign = false,
        icons = { "", "", "", "", "", "" },
        backgrounds = false,
        position = "inline",
      },
      code = {
        sign = false,
        style = "normal",
        border = "none",
      },
      bullet = {
        icons = { "•", "◦", "▪", "▫" },
      },
      checkbox = {
        unchecked = { icon = "○ " },
        checked = { icon = "● " },
      },
      dash = {
        enabled = true,
        icon = "—",
      },
    },
  },
}
