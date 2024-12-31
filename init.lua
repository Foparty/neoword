vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("config.lazy")
local opt = vim.opt
vim.g.have_nerd_font = true

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_icons = 1
--Make line numbers default
opt.number = true
opt.relativenumber = true
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.softtabstop = 2 -- 2 spaces for indent width (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces


vim.schedule(function()
    -- This function will run in Neovim's main loop, ensuring it doesn't interfere with other operations
    opt.clipboard = "unnamedplus"  -- Set the clipboard to use the system clipboard by default
end)

opt.undofile = true
opt.ignorecase = true
opt.smartcase = true

opt.updatetime = 250
opt.timeoutlen = 300

opt.splitright = true
opt.splitbelow = true

opt.termguicolors = true
-- opt.background = "dark"

opt.backspace = "indent,eol,start"

opt.inccommand = "split"

opt.wrap = true
opt.linebreak = true
opt.cursorline = true

opt.scrolloff = 10

opt.spelllang = "es"
opt.spell = false
-- COLORSCHEME
--
--

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]],
	{ desc = "Replace word under cursor globally" }
)

vim.keymap.set("n","<leader>e",":Ex<CR>")

vim.keymap.set("n", "<leader>r", vim.lsp.buf.format, { desc = "Format current buffer" })
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all text" })
vim.keymap.set("i", "kj", "<Esc>:w<CR>", { desc = "Exit insert mode and save file" })
vim.keymap.set("n","<leader>e",":Ex<CR>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

vim.keymap.set("n", "<space><space>x", ":so %<CR>", { desc = "Source current file" })

vim.keymap.set("n", "<right>", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<down>", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<left>", "<:w!<CR>", { desc = "Save current file" }) -- Note: This command seems incorrect, should be ":w<CR>"
vim.keymap.set("n", "<leader>k", ":bd!<CR>", { desc = "kills current buffer" })

vim.keymap.set("n", "<leader>x", ":wqa!<CR>", { desc = "Save all and quit" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to upper window" })
vim.keymap.set("n", "<leader>q", ":w<CR>:Ex<CR>", { desc = "Save and open file explorer" })

-- vim.keymap.set("n", "<C-q>", function()
-- 	local win_count = vim.fn.winnr("$")
-- 	if win_count > 1 then
-- 		vim.cmd("write")
-- 		vim.cmd("close")
-- 	else
-- 		vim.cmd("Ex")
-- 	end
-- end, { desc = "Close split or open file explorer if last window" })

vim.keymap.set("n", "<C-q>", function()
	local win_count = vim.fn.winnr("$")
	if win_count > 1 then
		vim.cmd("write")
		vim.cmd("close")
	else
		vim.cmd("Oil")
	end
end)

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move current line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move current line up" })
vim.keymap.set("v", "<A-j>", ":m '<-2<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "<A-k>", ":m '>+1<CR>gv=gv", { desc = "Move selected lines up" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page and center" })
vim.keymap.set("n", "<C-f>", "<C-f>zz", { desc = "Scroll down full page and center" })
vim.keymap.set("n", "<C-b>", "<C-b>zz", { desc = "Scroll up full page and center" })
vim.keymap.set("n","<leader>z",":ZenMode<CR>")

local function toggle_spell()
    vim.wo.spell = not vim.wo.spell
end
vim.keymap.set("n","<leader>sc",toggle_spell)
