return {
  "ibhagwan/fzf-lua",
  enabled = true,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    keymap = {
      builtin = {
        ["<c-d>"] = "preview-page-down", -- Keep default
        ["<c-u>"] = "preview-page-up",   -- Keep default
      },
      fzf = {
        ["tab"] = "toggle",
        ["alt-a"] = "toggle-all",
      },
    },
    winopts = {
      width = 0.95,  -- Override default
      height = 0.95, -- Override default
    },
  },
  keys = {
    {
      "<leader><leader>",
      function()
        require("fzf-lua").files({ cwd_only = true })
      end,
      desc = "files in cwd",
    },
    {
      "<leader>,",
      function()
        require("fzf-lua").buffers()
      end,
      desc = "open buffers",
    },
    {
      "<leader>/",
      function()
        require("fzf-lua").live_grep({ cwd_only = true })
      end,
      desc = "grep cwd",
    },
    {
      "<leader>w",
      function()
        require("fzf-lua").grep_cword({ cwd_only = true, prompt = "current WORD" })
      end,
      desc = "grep cwd",
    },
    {
      "<leader>ff",
      function()
        require("fzf-lua").files()
      end,
      desc = "files in cwd",
    },
    {
      "<leader>fc",
      function()
        require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "files in cwd",
    },
    {
      "<leader>fh",
      function()
        require("fzf-lua").helptags()
      end,
      desc = "help",
    },
    {
      "<leader>fk",
      function()
        require("fzf-lua").keymaps()
      end,
      desc = "keymaps",
    },
    {
      "gd",
      function()
        require("fzf-lua").lsp_definitions()
      end,
      desc = "branches",
    },
    {
      "g.",
      function()
        require("fzf-lua").lsp_code_actions()
      end,
      desc = "code actions",
    },
    {
      "gm",
      function()
        require("fzf-lua").marks()
      end,
      desc = "marks",
    },
    {
      "<leader>fr",
      function()
        require("fzf-lua").registers()
      end,
      desc = "registers",
    },
    {
      "<leader>ss",
      function()
        require("fzf-lua").spellcheck()
      end,
      desc = "spellcheck",
    },
    {
      "z=",
      function()
        require("fzf-lua").spell_suggest()
      end,
      desc = "spellcheck",
    },
  },
}
