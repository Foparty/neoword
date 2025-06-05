return {

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      explorer = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      scroll = { enabled = true },
    },
    keys = {
      -- Top Pickers & Explorer
      { "<leader><leader>", function() Snacks.picker.files() end,            desc = "Find Files" },
      { "<leader>,",        function() Snacks.picker.buffers() end,          desc = "Buffers" },
      { "<leader>/",        function() Snacks.picker.grep() end,             desc = "Grep" },
      { "<leader>nh",       function() Snacks.picker.notifications() end,    desc = "Notification History" },
      { "<C-e>",            function() Snacks.explorer() end,                desc = "File Explorer" },
      -- find
      -- { "<leader>fc",       function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
      { "<leader>fw",       function() Snacks.picker.grep_word() end,        desc = "Visual selection or word", mode = { "n", "x" } },
      -- git
      { "<leader>gl",       function() Snacks.picker.git_log() end,          desc = "Git Log" },
      { "<leader>gf",       function() Snacks.picker.git_log_file() end,     desc = "Git Log File" },
      -- Grep
      -- search
      { "<leader>sh",       function() Snacks.picker.help() end,             desc = "Help Pages" },
      { "<leader>sk",       function() Snacks.picker.keymaps() end,          desc = "Keymaps" },
      { "<leader>su",       function() Snacks.picker.undo() end,             desc = "Undo History" },
      -- LSP
      { "gd",               function() Snacks.picker.lsp_definitions() end,  desc = "Goto Definition" },
      { "<leader>ss",       function() Snacks.picker.lsp_symbols() end,      desc = "LSP Symbols" },
      -- { "<leader>sS",       function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
      -- Other
      { "<leader>z",        function() Snacks.zen() end,                     desc = "Toggle Zen Mode" },
      { "<leader>Z",        function() Snacks.zen.zoom() end,                desc = "Toggle Zoom" },
      { "<leader>bd",       function() Snacks.bufdelete() end,               desc = "Delete Buffer" },
      { "<leader>un",       function() Snacks.notifier.hide() end,           desc = "Dismiss All Notifications" },
      -- { "<c-/>",            function() Snacks.terminal() end,                desc = "Toggle Terminal" },
      -- { "<c-_>",            function() Snacks.terminal() end,                desc = "which_key_ignore" },
      { "]]",               function() Snacks.words.jump(vim.v.count1) end,  desc = "Next Reference",           mode = { "n", "t" } },
      { "[[",               function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference",           mode = { "n", "t" } },
    }
  }
}
