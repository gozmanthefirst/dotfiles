return {
  -- NOTE: Web Devicons
  { "nvim-tree/nvim-web-devicons" },

  -- NOTE: Wakatime
  { "wakatime/vim-wakatime", lazy = false },

  -- NOTE: Import Cost
  {
    "barrett-ruth/import-cost.nvim",
    build = "sh install.sh yarn",
    config = true,
  },

  -- NOTE: CMP Git
  { "petertriho/cmp-git", opts = {} },

  -- NOTE: Nvim DAP Go
  {
    "leoluz/nvim-dap-go",
    opts = {},
  },

  -- NOTE: Neotest Golang
  {
    "fredrikaverpil/neotest-golang",
  },

  -- NOTE: Schema Store
  {
    "b0o/SchemaStore.nvim",
    lazy = true,
    version = false, -- last release is way too old
  },

  -- NOTE: TailwindcssCSS
  { "roobert/tailwindcss-colorizer-cmp.nvim", opts = {} },
}
