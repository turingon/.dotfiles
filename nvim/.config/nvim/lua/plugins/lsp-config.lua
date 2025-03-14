return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright"
      }
    },
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "pyright", "tailwindcss", "texlab", "omnisharp" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      --      local def = require("lsp.default-lsp")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        --        on_attach = def.on_attach
      })

      -- Python Setup
      lspconfig.pyright.setup({
        capabilities = capabilities,
        --        on_attach = def.on_attach
      })

      --[[lspconfig.pylsp.setup({
        capabilities = capabilities
      })--]]

      --C/C++ Setup
      lspconfig.clangd.setup({
        capabilities = capabilities,
        --        on_attach = def.on_attach
      })

      --Web Dev Setup
      --HTML
      lspconfig.html.setup({
        capabilities = capabilities,
        --        on_attach = def.on_attach
      })

      --CSS
      lspconfig.cssls.setup({
        capabilities = capabilities,
        --        on_attach = def.on_attach
      })

      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        --        on_attach = def.on_attach
      })

      --TS/JS
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        init_options = {
          preferences = {
            disableSuggestions = true;
          }
        }
      })

      --LaTeX
      lspconfig.texlab.setup({
        capabilities = capabilities,
        --        on_attach = def.on_attach
      })

      --Hyprland
      lspconfig.hyprls.setup({
        capabilities = capabilities,
        --        on_attach = def.on_attach
      })

      --Unity
      lspconfig.omnisharp.setup({
        capabilities = capabilities,
        settings = {
          useModernNet = false,
          monoPath = vim.fn.system { 'which', 'mono' }
        },
        cmd = { 'omnisharp', '--languageserver', '--hostPID', tostring(vim.fn.getpid()) },
        filetypes = { 'cs' },
        root_dir = lspconfig.util.root_pattern('*.csproj', '*.sln', '.git'),
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "C", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gi", ":lua vim.lsp.buf.implementation()<CR>")
      vim.keymap.set("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
      vim.keymap.set("n", "<leader>gr", ":lua vim.lsp.buf.references()<CR>")
      vim.keymap.set("n", "<C-a>", vim.lsp.buf.format, {})
    end,

  },
}
