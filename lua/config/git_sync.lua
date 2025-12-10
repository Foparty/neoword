local function auto_git_sync()
  local cwd = vim.fn.getcwd()
  if vim.fn.isdirectory(cwd .. "/.git") == 1 then
    -- Commit local changes (if any)
    vim.fn.system("git add .")
    vim.fn.system("git commit -am 'auto: local changes' || true")
    vim.fn.system("git push || true")
    -- Pull latest changes
    vim.fn.system("git pull --rebase || true")
  end
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = auto_git_sync,
})