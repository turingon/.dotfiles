require("turingon.lazy.lazy")
require("turingon.core.vim-options")
require("turingon.core.keymap")

vim.g.clipboard = {
  name = "wl-clipboard-rs",
  copy = {
    ["+"] = "wl-copy",
    ["*"] = "wl-copy",
  },
  paste = {
    ["+"] = "wl-paste",
    ["*"] = "wl-paste",
  },
  cache_enabled = 1,
}

-- diagnostic signs for prettier gutter icons
local signs = {
  Error = "",
  Warn  = "",
  Hint  = "",
  Info  = "",
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- diagnostic config
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    spacing = 4,
  },
  float = { border = "rounded" },
  severity_sort = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})
