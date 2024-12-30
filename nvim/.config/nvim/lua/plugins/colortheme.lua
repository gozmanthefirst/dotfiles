return {
  -- NOTE: TokyoNight Theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = true },
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent",
        floats = "dark",
      },
      day_brightness = 0.9, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
      dim_inactive = true, -- dims inactive windows
      lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

      cache = true, -- When set to true, the theme will be cached for better performance

      on_colors = function(colors)
        colors.border = "#333333"
      end,
      on_highlights = function(highlights)
        highlights.FlashLabel.bg = ""
        highlights.FlashLabel.fg = "#ffffff"
        -- highlights.FlashLabel.fg = "#18c437" NOTE: Alternative value
      end,
    },

    init = function()
      vim.cmd.colorscheme("tokyonight-night")
      vim.cmd.hi("Comment gui=none")
    end,
  },
}
