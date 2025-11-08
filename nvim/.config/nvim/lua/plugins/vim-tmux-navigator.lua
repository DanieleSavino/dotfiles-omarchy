-- ~/.config/nvim/lua/plugins/tmux-navigator.lua
-- Seamless navigation between tmux panes and vim splits

return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate Left" },
    { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate Down" },
    { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate Up" },
    { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate Right" },
    { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Navigate Previous" },
  },
  init = function()
    -- Disable default mappings if you want full control
    vim.g.tmux_navigator_no_mappings = 0
    
    -- Don't allow navigation when zoomed in tmux
    vim.g.tmux_navigator_disable_when_zoomed = 1
    
    -- Save on switch (optional)
    vim.g.tmux_navigator_save_on_switch = 2 -- :update (only save if buffer changed)
  end,
}
