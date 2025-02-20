return {
  "jiaoshijie/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  keys = { -- load the plugin only when using it's keybinding:
    { "<leader>ht", "<cmd>lua require('undotree').toggle()<cr>" },
  },
  config = function()
    local undotree = require('undotree')
    undotree.setup({
      float_diff = true,      -- using float window previews diff, set this `true` will disable layout option
      layout = "left_bottom", -- "left_bottom", "left_left_bottom"
      position = "left",      -- "right", "bottom"
      ignore_filetype = { 'undotree', 'undotreeDiff', 'qf', 'TelescopePrompt', 'spectre_panel', 'tsplayground' },
      window = {
        winblend = 30,
      },
      keymaps = {
        ['d'] = "move_next",
        ['s'] = "move_prev",
        ['gj'] = "move2parent",
        ['D'] = "move_change_next",
        ['S'] = "move_change_prev",
        ['<cr>'] = "action_enter",
        ['p'] = "enter_diffbuf",
        ['q'] = "quit",
      },
    })
  end
}
