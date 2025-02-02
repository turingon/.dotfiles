return {
  'mbbill/undotree',
  config = function()
    vim.keymap.set('n', '<leader>ht', vim.cmd.UndotreeToggle)
    vim.keymap.set('n', '<leader>pht', vim.cmd.UndotreePersistUndo)
  end
}
