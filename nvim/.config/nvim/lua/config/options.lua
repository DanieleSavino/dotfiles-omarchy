-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = true

-- Default: 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Dart override
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dart",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- in your config/init.lua or after lazy setup
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    -- disable conform / null-ls formatting
    vim.b.autoformat = false
  end,
})

-- Set 4 spaces for C and C++
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    vim.bo.tabstop = 4 -- width of a tab character
    vim.bo.shiftwidth = 4 -- spaces used for each indent
    vim.bo.softtabstop = 4 -- how many spaces a <Tab> counts for in insert mode
    vim.bo.expandtab = true -- use spaces instead of actual tab characters
  end,
})
