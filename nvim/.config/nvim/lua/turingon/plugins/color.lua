return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night",
      light_style = "day",
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        functions = {},
        variables = {},
        sidebars = "transparent",
        floats = "transparent",
      },
      day_brightness = 0.3,
      dim_inactive = false,
      lualine_bold = false,

      on_colors = function(colors) end,

      on_highlights = function(highlights, colors) end,

      cache = true,
    })
    vim.cmd("colorscheme tokyonight")
  end
}
