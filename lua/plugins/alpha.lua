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

    -- Set header
    dashboard.section.header.val = {
      "███╗   ██╗██╗   ██╗██╗███╗   ███╗██╗    ██╗ ██████╗ ██████╗ ██████╗ ",
      "████╗  ██║██║   ██║██║████╗ ████║██║    ██║██╔═══██╗██╔══██╗██╔══██╗",
      "██╔██╗ ██║██║   ██║██║██╔████╔██║██║ █╗ ██║██║   ██║██████╔╝██║  ██║",
      "██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║██║███╗██║██║   ██║██╔══██╗██║  ██║",
      "██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║╚███╔███╔╝╚██████╔╝██║  ██║██████╔╝",
      "╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═════╝ ",
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("n", "  > New File", new_file),
      dashboard.button("e", "  > Toggle file explorer", "<cmd>Oil<CR>"),
      dashboard.button("f", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("w", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button(".", "󰁯  > Recent files", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
