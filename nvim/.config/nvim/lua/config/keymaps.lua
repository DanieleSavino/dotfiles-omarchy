-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Auto Format
vim.keymap.set({ "n", "v" }, "<leader>f", function()
  require("conform").format()
end, { desc = "Format buffer / selection" })
