return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", },
        automatic_installation = true,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")

      local on_attach = (function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "gd", "<CMD>Telescope lsp_definitions<CR>")
        vim.keymap.set("n", "K", function()
          vim.lsp.buf.hover()
        end, opts)
        vim.keymap.set("n", "<leader>ws", function()
          vim.lsp.buf.workspace_symbol()
        end, opts)
        vim.keymap.set("n", "<leader>vd", function()
          vim.diagnostic.open_float()
        end, opts)
        vim.keymap.set("n", "[d", function()
          vim.diagnostic.goto_next()
        end, opts)
        vim.keymap.set("n", "]d", function()
          vim.diagnostic.goto_prev()
        end, opts)
        vim.keymap.set("n", "<leader>ca", function()
          vim.lsp.buf.code_action()
        end, opts)
        vim.keymap.set("n", "<leader>rr", "<CMD>Telescope lsp_references<CR>")
        vim.keymap.set("n", "<leader>rn", function()
          vim.lsp.buf.rename()
        end, opts)
        vim.keymap.set("i", "<C-h>", function()
          vim.lsp.buf.signature_help()
        end, opts)
      end)

      -- Set rounded borders & transparent float windows
      local border = "rounded"
      local handlers = vim.lsp.handlers
      handlers["textDocument/hover"] = vim.lsp.with(handlers.hover, { border = border })
      handlers["textDocument/signatureHelp"] = vim.lsp.with(handlers.signature_help, { border = border })
      vim.diagnostic.config({ float = { border = border } })

      -- Lua LSP
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },

        },

        on_attach = on_attach
      })

      -- Python LSP
      lspconfig.pyright.setup({
        on_attach = on_attach
      })

      -- JavaScript / TypeScript / React LSP
      lspconfig.ts_ls.setup({
        on_attach = on_attach
      })

      lspconfig.harper_ls.setup({
        on_attach = on_attach
      })

      lspconfig.remark_ls.setup({
        on_attach = on_attach
      })

      lspconfig.bashls.setup({
        on_attach = on_attach
      })

      lspconfig.clangd.setup({
        on_attach = on_attach,
        cmd = {
          "clangd",
          [[--fallback-style={
            BasedOnStyle: Google,
        }]]
        }
      })
    end,
  },
}
