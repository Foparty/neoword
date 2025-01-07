-- Open file explorer
-- NOTE: this is without Oil.nvim
-- vim.keymap.set("n", "<leader>e", ":Ex<CR>", { desc = "Open file explorer" })
vim.keymap.set("n", "<leader>e", ":w<CR>:Oil<CR>", { desc = "[E]xplore files" })

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
    vim.cmd("write")
    vim.cmd("close")
  else
    vim.cmd("Oil") -- Note: 'Oil' is used here, assuming it's a file explorer plugin. Adjust if needed.
  end
end, { desc = "Close split or open file explorer if last window" })
vim.keymap.set("n", "<leader>k", ":bd!<CR>:Oil<CR>", { desc = "[K]ill / close File" })

-- NOTE: when you are used to HJKL i will change arrows for letters
-- Navigation between windows
-- vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to left window" })
-- vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to right window" })
-- vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to lower window" })
-- vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to upper window" })

vim.keymap.set("n", "<C-left>", "<C-w><C-h>", { desc = "Move focus to left window" })
vim.keymap.set("n", "<C-right>", "<C-w><C-l>", { desc = "Move focus to right window" })
vim.keymap.set("n", "<C-down>", "<C-w><C-j>", { desc = "Move focus to lower window" })
vim.keymap.set("n", "<C-up>", "<C-w><C-k>", { desc = "Move focus to upper window" })

-- QUICKFIX NEXT PREV
--
vim.keymap.set("n", "<C-j>", ":cnext<CR>", { desc = "Quickfix next" })
vim.keymap.set("n", "<C-k>", ":cprevious<CR>", { desc = "Quickfix prev" })

-- NOTE: the following options will allow to move one line by one when text wrap make a long line or paragraph multi line
local pencil = false -- State to track whether the mapping is active

local function toggle_pencil()
  if pencil then
    -- Reset to normal behavior
    vim.keymap.del('n', 'j')
    vim.keymap.del('n', 'k')
    vim.keymap.del('v', 'j')
    vim.keymap.del('v', 'k')
    print("Normal j/k movement restored")
  else
    -- Map j to gj and k to gk
    vim.keymap.set({ 'n', 'v' }, 'j', 'gjzz')
    vim.keymap.set({ 'n', 'v' }, 'k', 'gkzz')
    print("Using gj/gk for j/k movement")
  end
  pencil = not pencil
end

-- Map a key to toggle the movement behavior
vim.keymap.set('n', '<leader>p', toggle_pencil, { desc = '[T]oggle [P]encil / line by line' })
-- NOTE: end of pencil options to move single wrapped lines


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
vim.keymap.set("n", "<space><space>x", ":so %<CR>", { desc = "Source current file" })


-- Save all and quit
vim.keymap.set("n", "<leader>q", ":wqa!<CR>", { desc = "[Q]uit after saving all" })


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
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { desc = "[Z]en Mode" })

-- NOTE: spell toggle and spell check options
-- Toggle spell check

local function toggle_spell()
  vim.wo.spell = not vim.wo.spell -- Toggle spell checking for the current window
end

vim.keymap.set("n", "<leader>S", toggle_spell, { desc = "[S]pell check" })
-- NOTE: need to set better mappings conditionally on spell
-- Define your keymap
-- vim.keymap.set('n', 'z=', function()
--   if vim.o.spell then
--     vim.cmd('normal! z=')     -- Perform the default spell check action
--   else
--     -- Optionally, do something else or do nothing
--     print("Spell checking is not active.")
--   end
-- end, { desc = "Conditional spell check" })
vim.keymap.set("n", "<S-right>", ']s1z=', { desc = "next spell error and fix with option 1" })
vim.keymap.set("n", "<S-left>", '[s1z=', { desc = "prev spell error and fix with option 1" })
vim.keymap.set("n", "<leader>da", 'zg', { desc = "add word to dictionary" })
vim.keymap.set("n", "<leader>dw", 'zw', { desc = "wrong word to dictionary" })


-- NOTE:this will only work if vim-markdown installed
-- Table of Content in markdown files
-- vim.keymap.set("n", "<leader>tc", '<cmd>Toc<CR>', { desc = "[T]able of [C]ontent on Markdown files" })

-- new file in root
--
local function create_and_open_file_in_root()
  -- Find the project root (example using vim-rooter or similar functionality)
  local root_dir = vim.fn.getcwd() -- or use some other method to find project root

  -- Prompt for filename
  local filename = vim.fn.input("Enter filename:")

  -- Construct full path for the new file
  local full_path = vim.fn.fnamemodify(root_dir .. "/" .. filename, ":p")

  -- Open the file in a new buffer
  vim.cmd("edit " .. full_path)

  -- Enter insert mode
  vim.cmd("startinsert")
end

-- Map the function to a key, e.g., <leader>nf for "new file"
vim.keymap.set('n', '<leader>nf', create_and_open_file_in_root,
  { noremap = true, silent = true, desc = "[N]ew [F]ile in project" })

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
