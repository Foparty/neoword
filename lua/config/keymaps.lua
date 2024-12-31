-- Keymap for global search and replace of word under cursor
vim.keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]],
  { desc = "Replace word under cursor globally" }
)

-- Open file explorer
vim.keymap.set("n", "<leader>e", ":Ex<CR>", { desc = "Open file explorer" })

-- Format the current buffer using LSP
vim.keymap.set("n", "<leader>r", vim.lsp.buf.format, { desc = "Format current buffer" })

-- Select all text in the current buffer
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all text" })

-- Exit insert mode and save file
vim.keymap.set("i", "kj", "<Esc>:w<CR>", { desc = "Exit insert mode and save file" })

-- Clear search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Source the current file (useful for Lua or Vim script files)
vim.keymap.set("n", "<space><space>x", ":so %<CR>", { desc = "Source current file" })

-- Window management
vim.keymap.set("n", "<right>", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<down>", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<left>", ":w<CR>", { desc = "Save current file" }) -- Corrected command from ":w!<CR>" to ":w<CR>"
vim.keymap.set("n", "<leader>k", ":bd!<CR>", { desc = "Kill current buffer" })

-- Save all and quit
vim.keymap.set("n", "<leader>x", ":wqa!<CR>", { desc = "Save all and quit" })

-- Navigation between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to upper window" })

-- Save and then open file explorer
vim.keymap.set("n", "<leader>q", ":w<CR>:Ex<CR>", { desc = "Save and open file explorer" })

-- Close split or open file explorer if it's the last window
vim.keymap.set("n", "<C-q>", function()
  local win_count = vim.fn.winnr("$")
  if win_count > 1 then
    vim.cmd("write")
    vim.cmd("close")
  else
    vim.cmd("Oil") -- Note: 'Oil' is used here, assuming it's a file explorer plugin. Adjust if needed.
  end
end, { desc = "Close split or open file explorer if last window" })

-- Line movement
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move current line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move current line up" })
vim.keymap.set("v", "<A-j>", ":m '<-2<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "<A-k>", ":m '>+1<CR>gv=gv", { desc = "Move selected lines up" })

-- Search result navigation with centering
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })

-- Scrolling with centering
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page and center" })
vim.keymap.set("n", "<C-f>", "<C-f>zz", { desc = "Scroll down full page and center" })
vim.keymap.set("n", "<C-b>", "<C-b>zz", { desc = "Scroll up full page and center" })

-- Enter Zen Mode (assuming you have a ZenMode plugin installed)
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { desc = "Enter Zen Mode" })

-- Toggle spell check
local function toggle_spell()
  vim.wo.spell = not vim.wo.spell -- Toggle spell checking for the current window
end
vim.keymap.set("n", "<leader>sc", toggle_spell, { desc = "Toggle spell check" })
