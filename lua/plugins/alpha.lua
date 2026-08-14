return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local function open_specific_file()
      local file_path = vim.fn.stdpath("config") .. "/lua/config/spell.lua"
      vim.cmd("edit " .. file_path)
    end

    -- Map this function to a key or command
    vim.api.nvim_create_user_command("OpenSpecificFile", open_specific_file, {})

    -- Set header
    dashboard.section.header.val = {
      "                                                                    ",
      "                                                                    ",
      "███╗   ██╗██╗   ██╗██╗███╗   ███╗██╗    ██╗ ██████╗ ██████╗ ██████╗ ",
      "████╗  ██║██║   ██║██║████╗ ████║██║    ██║██╔═══██╗██╔══██╗██╔══██╗",
      "██╔██╗ ██║██║   ██║██║██╔████╔██║██║ █╗ ██║██║   ██║██████╔╝██║  ██║",
      "██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║██║███╗██║██║   ██║██╔══██╗██║  ██║",
      "██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║╚███╔███╔╝╚██████╔╝██║  ██║██████╔╝",
      "╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═════╝ ",
      "                                                                    ",
      "                                                                    ",
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("n", "  > New File", "<cmd>CreateNewFile<CR>"),
      dashboard.button("e", "  > Toggle file explorer", "<cmd>lua Snacks.explorer()<CR>"),
      dashboard.button("f", "󰱼  > Find File", function()
        require("fzf-lua").files()
      end),
      dashboard.button("w", "  > Find Word", function()
        require("fzf-lua").live_grep()
      end),
      dashboard.button("g", "󰓆  > Spelling Config", open_specific_file),
      dashboard.button("s", "  > Sessions", "<cmd>SessionSearch<CR>"),
      dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
