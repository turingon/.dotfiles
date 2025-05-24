return -- minimal installation
{
  "Hashino/doing.nvim",
  lazy = true,
  init = function()
    local doing = require("doing")

    -- example keymaps
    vim.keymap.set("n", "<leader>da", doing.add, { desc = "[D]oing: [A]dd", })
    vim.keymap.set("n", "<leader>de", doing.edit, { desc = "[D]oing: [E]dit", })
    vim.keymap.set("n", "<leader>dn", doing.done, { desc = "[D]oing: Do[n]e", })

    vim.keymap.set("n", "<leader>ds", function()
      vim.notify(doing.status(true), vim.log.levels.INFO,
        { title = "Doing:", icon = "", })
    end, { desc = "[D]oing: [S]tatus", })

    vim.api.nvim_create_autocmd({ "User", }, {
      pattern = "TaskModified",
      desc = "This is called when a task is added, edited or completed",
      callback = function()
        vim.defer_fn(function()
          local status = doing.status()
          if status ~= "" then
            vim.notify(status, vim.log.levels.INFO,
              { title = "Doing:", icon = "", })
          end
        end, 0)
      end,
    })
  end,
}
