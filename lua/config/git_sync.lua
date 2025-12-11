local function auto_git_entersync()
  local cwd = vim.fn.getcwd()
  if vim.fn.isdirectory(cwd .. "/.git") == 1 then
    -- Check for changes
    local status = vim.fn.systemlist("git status --porcelain")
    if #status > 0 then
      vim.fn.system("git add .")
      vim.fn.system("git commit -am 'auto: local changes' || true")
      vim.fn.system("git push || true")
    end
    -- Always pull latest changes
    vim.fn.system("git pull --rebase || true")
  end
end

local function auto_git_exitsync()
  local cwd = vim.fn.getcwd()
  if vim.fn.isdirectory(cwd .. "/.git") == 1 then
    -- Check for changes
    local status = vim.fn.systemlist("git status --porcelain")
    if #status > 0 then
      vim.fn.system("git add .")
      vim.fn.system("git commit -am 'auto: local changes' || true")
      vim.fn.system("git push || true")
    end
    -- Always pull latest changes
    vim.fn.system("git pull --rebase || true")
  end
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = auto_git_entersync,
})
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = auto_git_exitsync,
})

