return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local function new_file()
      -- Find the project root (example using vim-rooter or similar functionality)
      local root_dir = vim.fn.getcwd() -- or use some other method to find project root

      -- Prompt for filename
      local filename = vim.fn.input("Enter filename: ")

      -- Construct full path for the new file
      local full_path = vim.fn.fnamemodify(root_dir .. "/" .. filename, ":p")

      -- Open the file in a new buffer
      vim.cmd("edit " .. full_path)

      -- Enter insert mode
      vim.cmd("startinsert")
    end
    local function open_specific_file()
      local file_path = vim.fn.stdpath('config') .. '/lua/config/spell.lua'
      vim.cmd('edit ' .. file_path)
    end

    -- Map this function to a key or command
    vim.api.nvim_create_user_command('OpenSpecificFile', open_specific_file, {})

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
      dashboard.button("n", "  > New File", new_file),
      dashboard.button("e", "  > Toggle file explorer", "<cmd>Oil<CR>"),
      dashboard.button("f", "󰱼  > Find File", "<cmd>lua Snacks.picker.files()<CR>"),
      dashboard.button("w", "  > Find Word", "<cmd>lua Snacks.picker.grep()<CR>"),
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
