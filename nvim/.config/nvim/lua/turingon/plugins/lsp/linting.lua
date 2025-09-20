return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufWritePost", "InsertLeave", "BufReadPre", "BufNewFile" },
    config = function()
      require("lint").linters_by_ft = {
        lua = { "luacheck" },
        python = { "ruff" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
        callback = function() require("lint").try_lint() end,
      })
    end,
  },
}
