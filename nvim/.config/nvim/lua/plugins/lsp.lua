return {
  -- Mason: installer for LSPs
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },
  -- Mason-LSP integration
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "lua_ls", "clangd", "jdtls" },
      })
    end,
  },
  -- Mason tool installer for formatters/linters
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- Dart/Flutter
          "dart-debug-adapter",
        },
      })
    end,
  },
  -- Flutter Tools (includes LSP, formatting, and more)
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      -- Get capabilities from blink.cmp instead of nvim-cmp
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      require("flutter-tools").setup({
        ui = {
          border = "rounded",
          notification_style = "native",
        },
        decorations = {
          statusline = {
            app_version = true,
            device = true,
          },
        },
        debugger = {
          enabled = true,
          run_via_dap = true,
        },
        widget_guides = {
          enabled = true,
        },
        closing_tags = {
          highlight = "Comment",
          prefix = "// ",
          enabled = true,
        },
        dev_log = {
          enabled = true,
          open_cmd = "tabedit",
        },
        lsp = {
          color = {
            enabled = true,
            background = false,
            foreground = false,
            virtual_text = true,
            virtual_text_str = "■",
          },
          on_attach = function(client, bufnr)
            local buf_map = function(mode, lhs, rhs, opts)
              opts = opts or {}
              opts.buffer = bufnr
              vim.keymap.set(mode, lhs, rhs, opts)
            end
            -- LSP keymaps
            buf_map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
            buf_map("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
            buf_map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
            buf_map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
            buf_map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
            -- Flutter specific keymaps
            buf_map("n", "<leader>fc", "<cmd>Telescope flutter commands<CR>", { desc = "Flutter commands" })
            buf_map("n", "<leader>fr", "<cmd>FlutterRun<CR>", { desc = "Flutter run" })
            buf_map("n", "<leader>fq", "<cmd>FlutterQuit<CR>", { desc = "Flutter quit" })
            buf_map("n", "<leader>fd", "<cmd>FlutterDevices<CR>", { desc = "Flutter devices" })
            buf_map("n", "<leader>fe", "<cmd>FlutterEmulators<CR>", { desc = "Flutter emulators" })
            buf_map("n", "<leader>fR", "<cmd>FlutterReload<CR>", { desc = "Flutter reload" })
            buf_map("n", "<leader>fs", "<cmd>FlutterRestart<CR>", { desc = "Flutter restart" })
            buf_map("n", "<leader>fo", "<cmd>FlutterOutlineToggle<CR>", { desc = "Flutter outline" })
            buf_map("n", "<leader>fD", "<cmd>FlutterDevTools<CR>", { desc = "Flutter DevTools" })
          end,
          capabilities = capabilities,
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            renameFilesWithClasses = "prompt",
            enableSnippets = true,
            updateImportsOnRename = true,
          },
        },
      })
    end,
  },
  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.dart = { "dart_format" }
      return opts
    end,
  },
  -- Linting
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      -- Dart analysis is handled by flutter-tools LSP
      return opts
    end,
  },
}
