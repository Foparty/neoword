return {
  "shortcuts/no-neck-pain.nvim",
  ft = { "markdown", "text" },
  keys = {
    {
      "<leader>cc",
      "<cmd>NoNeckPain<cr>",
      desc = "Centre buffer",
    },
  },
  opts = {
    width = 72,
    minSideBufferWidth = 5,
  },
  config = function(_, opts)
    local nnp = require("no-neck-pain")
    nnp.setup(opts)

    local function enable_centered()
      if _G.NoNeckPain and _G.NoNeckPain.state and _G.NoNeckPain.state.enabled then
        return
      end
      nnp.enable("neoword-ia-writer")
    end

    -- Plugin loads on FileType, so enable for the buffer that triggered load.
    local ft = vim.bo.filetype
    if ft == "markdown" or ft == "text" then
      vim.schedule(enable_centered)
    end

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("neoword-ia-center", { clear = true }),
      pattern = { "markdown", "text" },
      callback = function()
        vim.schedule(enable_centered)
      end,
    })
  end,
}
