return {
  "folke/which-key.nvim",
  event = "VimEnter", -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require("which-key").setup({
      preset = 'modern',
      plugins = {
        spelling = {
          enabled = true,
          suggestions = 20,           -- Number of suggestions to show
        },
      },
    })

    -- Document existing key chains
    require("which-key").add({

      { "<leader>d", group = "[D]ictionary / diagnostics" },
      { "<leader>f", group = "[F]ind / Search options" },
      { "<leader>g", group = "[G]it" },
      { "<leader>l", group = "[L] Git / Sessions" },
      { "<leader>n", group = "[N]ew note or file" },
      { "<leader>p", group = "[P]aste" },
      { "<leader>s", group = "[S]ubstitute / search" },
      { "<leader>t", group = "[T]oggle" },
    })
  end,
}
