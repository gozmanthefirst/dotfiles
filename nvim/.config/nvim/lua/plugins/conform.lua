return {
  "stevearc/conform.nvim",
  opts = function()
    local opts = {
      formatters = {
        ["markdown-toc"] = {
          condition = function(_, ctx)
            for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
              if line:find("<!%-%- toc %-%->") then
                return true
              end
            end
          end,
        },
        ["markdownlint-cli2"] = {
          condition = function(_, ctx)
            local diag = vim.tbl_filter(function(d)
              return d.source == "markdownlint"
            end, vim.diagnostic.get(ctx.buf))
            return #diag > 0
          end,
        },
      },
      default_format_opts = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
        lsp_format = "fallback", -- not recommended to change
      },
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        go = { "goimports", "gofumpt" },
        ["markdown"] = { "prettierd", "prettier", "markdownlint-cli2", "markdown-toc" },
        ["markdown.mdx"] = { "prettierd", "prettier", "markdownlint-cli2", "markdown-toc" },
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
        -- typescript = { "prettierd", "prettier", stop_after_first = true },
        -- javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        -- typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        -- svelte = { "prettierd", "prettier", stop_after_first = true },
        -- css = { "prettierd", "prettier", stop_after_first = true },
        -- html = { "prettierd", "prettier", stop_after_first = true },
        -- json = { "prettierd", "prettier", stop_after_first = true },
        -- yaml = { "prettierd", "prettier", stop_after_first = true },
        -- markdown = { "prettierd", "prettier", stop_after_first = true },
        -- graphql = { "prettierd", "prettier", stop_after_first = true },
        -- postgresql = { "pg_format" },
        -- rust = { "rustfmt" },
      },
    }
    return opts
  end,
}
