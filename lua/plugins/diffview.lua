return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>dv", "<cmd>DiffviewOpen<CR>", desc = "Open Diffview" },
    { "<leader>df", "<cmd>DiffviewFileHistory<CR>", desc = "File History" },
  },
}