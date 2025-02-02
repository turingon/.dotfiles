return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  config = function()

    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local extras = require("luasnip.extras")
    local rep = extras.rep
    local fmt = require("luasnip.extras.fmt").fmt
    local c = ls.choice_node
    local f = ls.function_node

    vim.keymap.set({ "i", "s" }, "<C-k", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-j", function()
      if ls.jumpable(-1) then
        ls.jumpable(-1)
      end
    end, { silent = true })
  end
}
