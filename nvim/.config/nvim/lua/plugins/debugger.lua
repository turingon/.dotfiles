return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap-python"
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local path = "/home/Doruk/.local/share/nvim/mason/packages/debugpy/venv/bin/python"


    require("dapui").setup()
    require("dap-python").setup(path)

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set('n', '<F5>', dap.continue, {})
    vim.keymap.set('n', '<F6>', dap.step_over, {})
    vim.keymap.set('n', '<F7>', dap.step_into, {})
    vim.keymap.set('n', '<F8>', dap.step_out, {})
    vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint, {})
    vim.keymap.set('n', '<Leader>B', dap.set_breakpoint, {})
    vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
    vim.keymap.set('n', '<Leader>dr', dap.repl.open, {})
    vim.keymap.set('n', '<Leader>dl', dap.run_last, {})
  end,
}
