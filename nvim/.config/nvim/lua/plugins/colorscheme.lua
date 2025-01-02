return {
  -- Gruvbox
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_foreground = "original"
      -- vim.g.gruvbox_material_foreground = "material"  NOTE: This is the default!
      vim.g.gruvbox_material_transparent_background = 2
      vim.g.gruvbox_material_dim_inactive_windows = 1
      vim.cmd.colorscheme("gruvbox-material")

      -- Customize flash.nvim colors
      vim.api.nvim_set_hl(0, "FlashLabel", { bg = "#000000", fg = "#ffffff", bold = true })
    end,
  },
}
