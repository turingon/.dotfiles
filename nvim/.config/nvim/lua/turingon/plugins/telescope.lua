return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    local actions = require("telescope.actions")
    require("telescope").setup({
      defaults = {
        pickers = {
          find_files = {
            theme = "dropdown",
          }
        },
        layout_config = {
          vertical = { width = 1.0 }
          -- other layout configuration here
        },
        mappings = {
          i = {
            ["jj"] = actions.close,
          },
        },
        file_ignore_patterns = {
          "node_modules",
          ".git",
          "build",
          "dist",
          "venv",
          "%.pyc$",
          "%.o$",
          "%.obj$",
        },
      },
    })
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
  end
}
