return {
  "nvimtools/none-ls.nvim",

  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        --Lua Setup
        null_ls.builtins.formatting.stylua,

        --Python Setup
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.mypy,
        --null_ls.builtins.diagnostics.ruff,

        null_ls.builtins.formatting.google_java_format,

        --TS/JS Setup
        null_ls.builtins.formatting.prettier,
        --require("none-ls.diagnostics.eslint"),

        --Latex Setup
        require("none-ls.formatting.latexindent")
      },
    })
    vim.keymap.set("n", "<C-a>", vim.lsp.buf.format, {})
  end,
}
