return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "cpp", "python", "javascript", "html", "css", "java","go" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })

        for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
            vim.api.nvim_set_hl(1, group, {})
        end
    end
}
