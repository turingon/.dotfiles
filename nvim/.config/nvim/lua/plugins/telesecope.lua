return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      'nvim-telescope/telescope-media-files.nvim',
      'nvim-lua/popup.nvim'
    },
    pickers = {
      colorscheme = {
        enable_preview = true
      }
    },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
      vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {})
      vim.keymap.set("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>")
      vim.keymap.set("n", "<leader>fe", "<cmd> Telescope file_browser <CR>")
      vim.keymap.set("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>")
      vim.keymap.set("n", "<leader>fc", "<cmd> Telescope colorschemes <CR>")
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
          media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = { "png", "webp", "jpg", "jpeg" },
            -- find command (defaults to `fd`)
            find_cmd = "rg"
          }
        },
      })
      require("telescope").load_extension("ui-select")
      require('telescope').load_extension('media_files')
    end,
  },
}
