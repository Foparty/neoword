vim.g.mapleader = " "      -- Set space as the global leader key
vim.g.maplocalleader = " " -- Set space as the local leader key

-- Enable nerd font icons if available
vim.g.have_nerd_font = true -- We have nerd fonts installed

vim.foldenable = true
-- Netrw (file explorer) settings
-- NOTE: if no other file explorer installed (OIL) by default uncomment next 3 lines
-- vim.g.netrw_banner = 0    -- Hide the banner in netrw
-- vim.g.netrw_liststyle = 1 -- Use tree-like view in netrw
-- vim.g.netrw_icons = 1     -- Show icons in netrw if nerd fonts are installed

-- Local options
local opt = vim.opt

-- Line numbers
opt.number = true         -- Show line numbers
opt.relativenumber = true -- Show relative line numbers

-- Tabs and Indentation
opt.tabstop = 2      -- 2 spaces for tabs (matches Prettier default)
opt.softtabstop = 2  -- 2 spaces for tab when editing
opt.shiftwidth = 2   -- 2 spaces for auto indent
opt.expandtab = true -- Convert tabs to spaces

-- Clipboard settings (scheduled to avoid issues at startup)
vim.schedule(function()
  opt.clipboard = "unnamedplus" -- Use system clipboard for copy-paste
end)

-- Undo, case sensitivity, and search
opt.undofile = true   -- Keep undo history after file closes
opt.ignorecase = true -- Ignore case in search patterns
opt.smartcase = true  -- Override ignorecase if search contains capital letters

-- Timing for various Neovim operations
opt.updatetime = 250 -- Faster updates for things like CursorHold
opt.timeoutlen = 300 -- Time to wait for a mapped sequence to complete

-- Window splitting behavior
opt.splitright = true -- New vertical splits go to the right
opt.splitbelow = true -- New horizontal splits go below

-- Colors
opt.termguicolors = true -- Enable 24-bit RGB colors in the TUI

-- Backspace behavior
opt.backspace = "indent,eol,start" -- Allow backspacing over autoindent, line breaks, and start of insert action

-- Search and command line
opt.inccommand = "split" -- Show effects of a command incrementally in a split window

-- Text wrapping and cursor line
opt.wrap = true       -- Enable text wrapping
opt.linebreak = true  -- Wrap lines at word boundaries
opt.cursorline = true -- Highlight the current line
-- WARN: i don't recommend turning this on because after editing in neovim and moving to any other software then lines will still be 64ch
-- opt.textwidth = 64 -- this will create a brand new line after 64 characters

-- Scrolling
opt.scrolloff = 10 -- Keep 10 lines of context around the cursor

-- Spell checking
-- NOTE: it will accept "es" or "fr" and many other language options.
opt.spelllang = "en_us" -- Use Spanish for spell checking
opt.spell = false       -- Disable spell checking by default

-- Autocommand to highlight text when yanked (copied)
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank() -- Highlight the text that was just yanked
  end,
})
-- markdown specific
-- BUG: can't make it too work without auto folding witch is very anoying
vim.g.markdown_folding_disabled = 0
vim.g.vim_markdown_folding_disabled = 1
vim.g.foldmethod = 'manual'
