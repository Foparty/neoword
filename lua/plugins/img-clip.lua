return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    default = {
      dir_path = "assets",
      relative_to_current_file = true,
    },
  },
  keys = {
    { "<leader>pi", "<cmd>PasteImage<cr>", desc = "[P]aste [I]mage" },
  },
}
