-- local mappings = require("telescope.mappings")
return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "debugloop/telescope-undo.nvim",
    -- NOTE: these are the default mappings fot undo telescope
    -- mappings = {
    --         i = {
    --           ["<cr>"] = require("telescope-undo.actions").yank_additions,
    --           ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
    --           ["<C-cr>"] = require("telescope-undo.actions").restore,
    --           -- alternative defaults, for users whose terminals do questionable things with modified <cr>
    --           ["<C-y>"] = require("telescope-undo.actions").yank_deletions,
    --           ["<C-r>"] = require("telescope-undo.actions").restore,
    --         },
    --         n = {
    --           ["y"] = require("telescope-undo.actions").yank_additions,
    --           ["Y"] = require("telescope-undo.actions").yank_deletions,
    --           ["u"] = require("telescope-undo.actions").restore,
    --         },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "nvim-tree/nvim-web-devicons",            enabled = vim.g.have_nerd_font },
    },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        layout_config = {
          width = 0.99,
          height = 0.99,
          preview_cutoff = 60,
          horizontal = {
            -- Adjust these values to make the preview larger than the results
            prompt_position = "top",
            preview_width = 0.70, -- 75% of the available space for preview
            results_width = 0.30, -- 25% for results
          },
        },
        mappings = {
          i = {
            ["<C-q>"] = require("telescope.actions").smart_send_to_qflist
                + require("telescope.actions").open_qflist,
          },
          n = {
            ["<C-q>"] = require("telescope.actions").smart_send_to_qflist
                + require("telescope.actions").open_qflist,
          },
        },
      },
      -- pickers = {}
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })
    require("telescope").load_extension("undo")
    vim.keymap.set("n", "<leader>uh", "<cmd>Telescope undo<cr>", { desc = '[U]ndo [H]istory' })
    -- Enable Telescope extensions if they are installed
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    -- See `:help telescope.builtin`
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set("n", "<leader>,", function()
      builtin.buffers()
    end, { desc = "[ ] Find existing buffers" })
    vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
    local function search_tag()
      -- Get the word under the cursor or selection
      local word = vim.fn.expand("<cword>")

      -- Prepend '#' to the word
      local search_string = "[[" .. word .. "]]"

      -- Call grep_string with the modified search string
      require('telescope.builtin').grep_string({ search = search_string })
    end
    vim.keymap.set("n", "<leader>fh", search_tag, { desc = "[S]earch [K]eywords" })
    vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = '[F]ind [T]odos' })

    -- Shortcut for searching your Neovim configuration files
    -- NOTE: why would I need to check the files from anywhere if im not a programmer
    -- vim.keymap.set("n", "<leader>fn", function()
    --   builtin.find_files({ cwd = vim.fn.stdpath("config") })
    -- end, { desc = "[S]earch [N]eovim files" })

    vim.keymap.set("n", "<leader>fn", function()
      builtin.find_files({
        prompt_title = "Find Note",
        cwd = "/Users/fo/notes",
      })
    end, { desc = 'Find in external notes' })
    vim.keymap.set("n", "<leader>fm", function()
      builtin.live_grep({
        prompt_title = "Live Grep in Notes",
        cwd = "/Users/fo/notes",
      })
    end, { desc = "Search words in external notes" })
  end,
}
