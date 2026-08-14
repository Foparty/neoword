-- Spell checking (bilingual: English + Spanish)
-- NOTE: it will accept "es" or "fr" and many other language options.
vim.opt.spelllang = { "en", "es" }
vim.opt.spell = false -- Disable spell checking by default (markdown/text ftplugins turn it on)

-- WARN: don't forget to save and quit after changing this file since
-- once you turn it on later on it will have to create the corresponding
-- files on the spell folder for the corresponding language
