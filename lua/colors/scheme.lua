local M = {}

-- Define your color palette
local colors = {
  darkGray = "#606060",
  -- green = "#00FF00",
  bg = "#1B1A1A",
  fg = "#C8C8C8"
  -- Add more colors as needed
}

-- Function to set highlight groups
function M.setup()
  -- Clear existing highlights if any
  vim.api.nvim_command('highlight clear')
  if vim.fn.exists('syntax_on') then
    vim.api.nvim_command('syntax reset')
  end
  vim.o.background = 'dark' -- or 'light'
  vim.g.colors_name = 'scheme'

  -- Define highlights
  vim.api.nvim_set_hl(0, 'Comment', { fg = colors.darkGray })
  -- vim.api.nvim_set_hl(0, 'String', { fg = colors.green })
  -- Add more highlight groups...

  -- Example for setting background and foreground for Normal text
  vim.api.nvim_set_hl(0, 'Normal', { fg = colors.fg, bg = colors.bg })
end

-- Initialize the color scheme
M.setup()

return M
