return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "prettier",
      "hadolint",
      "goimports",
      "gofumpt",
      "gomodifytags",
      "impl",
      "delve",
      "markdownlint-cli2",
      "markdown-toc",
      "sqlfluff",
      "codelldb",
    },
  },
}
