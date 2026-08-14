-- Auto git sync for ~/notes and ~/journal.
-- Disabled: it delayed enter/quit while waiting on git pull/push.
-- To restore: uncomment the block below and require("config.git_sync") in init.lua.
-- :GitSync / <leader>gs is a manual full sync (add/commit/push/pull).
-- VimEnter pulls in the background. VimLeavePre detaches commit/push if dirty.

--[[
local allowed_roots = {
  vim.fn.expand("~/notes"),
  vim.fn.expand("~/journal"),
}

local function repo_cwd()
  local cwd = vim.fn.resolve(vim.fn.getcwd())
  for _, root in ipairs(allowed_roots) do
    root = vim.fn.resolve(root)
    if cwd == root or vim.startswith(cwd, root .. "/") then
      if vim.fn.isdirectory(cwd .. "/.git") == 1 then
        return cwd
      end
    end
  end
  return nil
end

local function git_sync_blocking()
  local cwd = repo_cwd()
  if not cwd then
    return false
  end
  local status = vim.fn.systemlist({ "git", "-C", cwd, "status", "--porcelain" })
  if #status > 0 then
    vim.fn.system({ "git", "-C", cwd, "add", "." })
    vim.fn.system({ "git", "-C", cwd, "commit", "-am", "auto: local changes" })
    vim.fn.system({ "git", "-C", cwd, "push" })
  end
  vim.fn.system({ "git", "-C", cwd, "pull", "--rebase" })
  return true
end

vim.api.nvim_create_user_command("GitSync", function()
  if git_sync_blocking() then
    vim.notify("Git sync complete", vim.log.levels.INFO)
  else
    vim.notify("Git sync only runs in ~/notes or ~/journal", vim.log.levels.WARN)
  end
end, { desc = "Sync git in notes or journal" })

vim.keymap.set("n", "<leader>gs", "<cmd>GitSync<CR>", { desc = "[G]it [S]ync notes/journal" })

-- Background pull after startup. Do not wait on the network.
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local cwd = repo_cwd()
    if cwd then
      vim.system({ "git", "pull", "--rebase" }, { cwd = cwd })
    end
  end,
})

-- Detach commit/push so :qa is not waiting on git.
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    local cwd = repo_cwd()
    if not cwd then
      return
    end
    local status = vim.fn.systemlist({ "git", "-C", cwd, "status", "--porcelain" })
    if #status == 0 then
      return
    end
    vim.system({
      "bash",
      "-c",
      "git add . && git commit -am 'auto: local changes' || true; git push || true",
    }, { cwd = cwd, detach = true })
  end,
})
]]
