-- Select all text in the current buffer
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all text" })

-- Exit insert mode and save file
vim.keymap.set("i", "kj", "<Esc>:w<CR>", { desc = "Exit insert mode and save file" })

-- Window management
vim.keymap.set("n", "<right>", "<C-w>v", { desc = "Split window - right" })
vim.keymap.set("n", "<down>", "<C-w>s", { desc = "Split window - down" })
vim.keymap.set("n", "<left>", ":w<CR>", { desc = "Save file" })
-- next will do same as <C-q> that basicly closes the window if splits or takes you to file explorer if just one buffer
vim.keymap.set("n", "<up>", function()
  local win_count = vim.fn.winnr("$")
  if win_count > 1 then
    vim.cmd("update")
    vim.cmd("close")
  else
    vim.cmd("update")
    vim.cmd("Oil") -- Note: 'Oil' is used here, assuming it's a file explorer plugin. Adjust if needed.
  end
end, { desc = "Close split or open file explorer if last window" })
vim.keymap.set("n", "<leader>k", ":bd!<CR>:Oil<CR>", { desc = "[K]ill / close File" })
vim.keymap.set("n", "<leader>ka", ":%bd!<CR>:Oil<CR>", { desc = "[K]ill / close File" })

-- NOTE: when you are used to HJKL i will change arrows for letters
-- Navigation between windows
-- vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to left window" })
-- vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to right window" })
-- vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to lower window" })
-- vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to upper window" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to upper window" })

-- QUICKFIX NEXT PREV
--
vim.keymap.set("n", "<C-]>", ":cnext<CR>", { desc = "Quickfix next" })
vim.keymap.set("n", "<C-[>", ":cprevious<CR>", { desc = "Quickfix prev" })

-- NOTE: the following options will allow to move one line by one when text wrap make a long line or paragraph multi line


-- Keymap for global search and replace of word under cursor
vim.keymap.set(
  "n",
  "<leader>sf",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]],
  { desc = "[S]ubstitute in [F]ile" }
)

vim.keymap.set(
  "n",
  "<leader>se",
  [[:cfdo %s/\<<C-r><C-w>\>/<C-r><C-w>/gc | update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>]],
  { desc = "[S]ubstitute [E]verwhere" }
)
-- Format the current buffer using LSP
vim.keymap.set("n", "<leader>r", vim.lsp.buf.format, { desc = "[R]eformat file" })

-- Clear search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Source the current file (useful for Lua or Vim script files)
-- WARN: do comment line below after development
vim.keymap.set("n", "<space>sf", ":so %<CR>", { desc = "Source current file" })


-- Save all and quit
vim.keymap.set("n", "<leader>q", ":wqa!<CR>", { desc = "[Q]uit after saving all" })


-- Close split or open file explorer if it's the last window
-- vim.keymap.set("n", "<C-q>", function()
--   vim.cmd("update")
--   vim.cmd("Oil")
-- end, { desc = "Close split or open file explorer if last window" })
-- vim.keymap.set("n", "<C-e>", function()
--   vim.cmd("update")
--   vim.cmd("Oil")
-- end, { desc = "Close split or open file explorer if last window" })


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
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { desc = "[Z]en Mode" })

-- NOTE: spell toggle and spell check options
-- Toggle spell check

local function toggle_spell()
  vim.wo.spell = not vim.wo.spell -- Toggle spell chacina for the current window
end

vim.keymap.set("n", "<leader>S", toggle_spell, { desc = "[S]pell / tab / z=" })
vim.keymap.set('n', 'gs', function() require("which-key").show("z=") end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>da", 'zg', { desc = "add word to dictionary" })
vim.keymap.set("n", "<leader>dw", 'zw', { desc = "wrong word to dictionary" })


-- NOTE:this will only work if vim-markdown installed
-- Table of Content in markdown files
-- vim.keymap.set("n", "<leader>tc", '<cmd>Toc<CR>', { desc = "[T]able of [C]ontent on Markdown files" })

-- new file in root
--
vim.api.nvim_create_user_command("CreateNewFile", function()
  -- Prompt for a custom filename
  local filename = vim.fn.input("Enter file name:", "", "file")

  -- Ensure the filename has a .md extension
  if not filename:match("%.md$") then
    filename = filename .. ".md"
  end

  -- Use the current working directory
  local current_dir = vim.fn.getcwd()
  local filepath = current_dir .. "/" .. filename

  -- Check if file exists
  if vim.fn.filereadable(filepath) == 1 then
    -- If the file exists, just open it
    vim.cmd("edit " .. filepath)
  else
    -- If the file doesn't exist, create it
    vim.fn.writefile({}, filepath, "b")
    vim.cmd("edit " .. filepath)
    -- Add a default line to avoid empty buffer
    vim.api.nvim_buf_set_lines(0, 0, -1, true, { "" })
  end

  -- Move to end of buffer, insert two new lines, and start insert mode for both cases
  vim.cmd("$ | startinsert")
end, {})

vim.keymap.set("n", "<leader>nf", ":CreateNewFile<CR>", { noremap = true, silent = true, desc = '[N]ew [F]ile' })


-- Exit to splash / welcome screen
vim.keymap.set('n', '<Esc><Esc>', ':Alpha<CR>')

-- external notes section

vim.api.nvim_create_user_command("CreateNewNote", function()
  -- Prompt for a custom filename
  local filename = vim.fn.input("Enter note name:", "", "file")

  -- Ensure the filename has a .md extension
  if not filename:match("%.md$") then
    filename = filename .. ".md"
  end

  local filepath = "~/notes/" .. filename
  local expanded_filepath = vim.fn.expand(filepath)

  -- Ensure directory exists
  vim.fn.mkdir(vim.fn.fnamemodify(expanded_filepath, ":h"), "p")

  -- Check if file exists
  if vim.fn.filereadable(expanded_filepath) == 1 then
    -- If the file exists, just open it
    vim.cmd("edit " .. filepath)
  else
    -- If the file doesn't exist, create it
    vim.fn.writefile({}, expanded_filepath, "b")
    vim.cmd("edit " .. filepath)
    -- Add a default line to avoid empty buffer
    vim.api.nvim_buf_set_lines(0, 0, -1, true, { "# New Note" })
  end

  -- Move to end of buffer, insert two new lines, and start insert mode for both cases
  vim.cmd("$ | put _ | put _ | startinsert")
end, {})

vim.keymap.set("n", "<leader>nn", ":CreateNewNote<CR>", { noremap = true, silent = true, desc = '[N]ew [N]ote external' })

vim.api.nvim_create_user_command("CreateJournal", function()
  local filename = "~/journal/" .. vim.fn.strftime("%d-%m-%Y") .. ".md"
  local expanded_filename = vim.fn.expand(filename)

  -- Ensure directory exists
  vim.fn.mkdir(vim.fn.fnamemodify(expanded_filename, ":h"), "p")

  -- Check if file exists
  if vim.fn.filereadable(expanded_filename) == 1 then
    -- If the file exists, just open it
    vim.cmd("edit " .. filename)
  else
    -- If the file doesn't exist, create it
    vim.fn.writefile({}, expanded_filename, "b")
    vim.cmd("edit " .. filename)
    -- Add a default line to avoid empty buffer
    vim.api.nvim_buf_set_lines(0, 0, -1, true, { "# New Note" })
  end

  -- Move to end of buffer, insert two new lines, and start insert mode for both cases
  vim.cmd("$ | put _ | put _ | startinsert")
end, {})

vim.keymap.set('n', '<leader>nj', ':CreateJournal<CR>', { desc = '[N]ew [J]ournal note' })
