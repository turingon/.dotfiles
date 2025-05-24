return {
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      --"rafamadriz/friendly-snippets",
    },

  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        config = true
      },
    },
    opts = function(_, opts)
      opts.formatting = {
        format = require("nvim-highlight-colors").format
      }
    end,

    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })


      cmp.setup.cmdline('?', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })


      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'cmdline' },
          {
            name = 'path'
          }
        }
      })


      local icons = {
        Text          = " Text", -- Text
        Method        = " Method", -- Method
        Function      = "󰊕 Function", -- Function
        Constructor   = " Constructor", -- Constructor
        Field         = " Field", -- Field
        Variable      = " Variable", -- Variable
        Class         = " Class", -- Class
        Interface     = " Interface", -- Interface
        Module        = " Module", -- Module
        Property      = " Property", -- Property
        Unit          = " Unit", -- Unit (or "")
        Value         = " Value", -- Value
        Enum          = " Enum", -- Enum
        Keyword       = " Keyword", -- Keyword
        Snippet       = " Snippet", -- Snippet
        Color         = " Color", -- Color
        File          = " File", -- File
        Reference     = " Reference", -- Reference
        Folder        = " Folder", -- Folder
        EnumMember    = " EnumMember", -- Enum Member
        Constant      = " Constant", -- Constant
        Struct        = " Struct", -- Struct
        Event         = " Event", -- Event
        Operator      = " Operator", -- Operator
        TypeParameter = " Type Parameter", -- Type parameter
      }
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete {},
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),

        }),
        formatting = {

          format = function(entry, vim_item)
            local highlights_info = require("colorful-menu").cmp_highlights(entry)

            -- highlight_info is nil means we are missing the ts parser, it's
            -- better to fallback to use default `vim_item.abbr`. What this plugin
            -- offers is two fields: `vim_item.abbr_hl_group` and `vim_item.abbr`.
            -- 

            if highlights_info ~= nil then
              vim_item.abbr_hl_group = highlights_info.highlights
              vim_item.abbr = highlights_info.text
              vim_item.kind = icons[vim_item.kind] or "Foo"
            end

            return vim_item
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
          { name = "path" }
        }),
      })
    end,
  },
}
