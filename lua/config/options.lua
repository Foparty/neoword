vim.g.mapleader = " "      -- Set space as the global leader key
vim.g.maplocalleader = " " -- Set space as the local leader key

-- Enable nerd font icons if available
vim.g.have_nerd_font = true -- We have nerd fonts installed

-- Netrw (file explorer) settings
-- Snacks explorer replaces netrw; leave these commented.

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

-- Text wrapping and cursor line (markdown/text ftplugins enable wrap)
opt.wrap = false
opt.linebreak = true
opt.breakindent = true
opt.showbreak = "↪ "
opt.cursorline = true
-- WARN: i don't recommend turning this on because after editing in neovim and moving to any other software then lines will still be 64ch
-- opt.textwidth = 64 -- this will create a brand new line after 64 characters

-- Scrolling
opt.scrolloff = 10 -- Keep 10 lines of context around the cursor


-- Autocommand to highlight text when yanked (copied)
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank() -- Highlight the text that was just yanked
  end,
})
-- Folding: keep manual so markdown headings do not auto-fold
opt.foldenable = false
opt.foldmethod = "manual"
vim.g.markdown_folding_disabled = 1
vim.g.vim_markdown_folding_disabled = 1

-- vim.api.nvim_set_hl(0, "Normal", { fg = "#cccccc", bg = "#1a1a1a" })
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#282835" })
