return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = false,
      exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
    },
    servers = {
      dockerls = {},
      docker_compose_language_service = {},
    },
    gopls = {
      settings = {
        gopls = {
          gofumpt = true,
          codelenses = {
            gc_details = false,
            generate = true,
            regenerate_cgo = true,
            run_govulncheck = true,
            test = true,
            tidy = true,
            upgrade_dependency = true,
            vendor = true,
          },
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
          analyses = {
            fieldalignment = true,
            nilness = true,
            unusedparams = true,
            unusedwrite = true,
            useany = true,
          },
          usePlaceholders = true,
          completeUnimported = true,
          staticcheck = true,
          directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
          semanticTokens = true,
        },
      },
    },
    jsonls = {
      -- lazy-load schemastore when needed
      on_new_config = function(new_config)
        new_config.settings.json.schemas = new_config.settings.json.schemas or {}
        vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
      end,
      settings = {
        json = {
          format = {
            enable = true,
          },
          validate = { enable = true },
        },
      },
    },
    marksman = {},
    prismals = {},
    tailwindcss = {
      -- exclude a filetype from the default_config
      filetypes_exclude = { "markdown" },
      -- add additional filetypes to the default_config
      filetypes_include = {},
      -- to fully override the default_config, change the below
      -- filetypes = {}
    },
    taplo = {
      keys = {
        {
          "K",
          function()
            if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
              require("crates").show_popup()
            else
              vim.lsp.buf.hover()
            end
          end,
          desc = "Show Crate Documentation",
        },
      },
    },
    yamlls = {
      -- Have to add this for yamlls to understand that we support line folding
      capabilities = {
        textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
          },
        },
      },
      -- lazy-load schemastore when needed
      on_new_config = function(new_config)
        new_config.settings.yaml.schemas =
          vim.tbl_deep_extend("force", new_config.settings.yaml.schemas or {}, require("schemastore").yaml.schemas())
      end,
      settings = {
        redhat = { telemetry = { enabled = false } },
        yaml = {
          keyOrdering = false,
          format = {
            enable = true,
          },
          validate = true,
          schemaStore = {
            -- Must disable built-in schemaStore support to use
            -- schemas from SchemaStore.nvim plugin
            enable = false,
            -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
            url = "",
          },
        },
      },
    },
  },
  setup = {
    gopls = function(_, opts)
      -- workaround for gopls not supporting semanticTokensProvider
      -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
      LazyVim.lsp.on_attach(function(client, _)
        if not client.server_capabilities.semanticTokensProvider then
          local semantic = client.config.capabilities.textDocument.semanticTokens
          client.server_capabilities.semanticTokensProvider = {
            full = true,
            legend = {
              tokenTypes = semantic.tokenTypes,
              tokenModifiers = semantic.tokenModifiers,
            },
            range = true,
          }
        end
      end, "gopls")
      -- end workaround
    end,
    tailwindcss = function(_, opts)
      local tw = LazyVim.lsp.get_raw_config("tailwindcss")
      opts.filetypes = opts.filetypes or {}

      -- Add default filetypes
      vim.list_extend(opts.filetypes, tw.default_config.filetypes)

      -- Remove excluded filetypes
      --- @param ft string
      opts.filetypes = vim.tbl_filter(function(ft)
        return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
      end, opts.filetypes)

      -- Additional settings for Phoenix projects
      opts.settings = {
        tailwindCSS = {
          includeLanguages = {
            elixir = "html-eex",
            eelixir = "html-eex",
            heex = "html-eex",
          },
        },
      }

      -- Add additional filetypes
      vim.list_extend(opts.filetypes, opts.filetypes_include or {})
    end,

    yamlls = function()
      -- Neovim < 0.10 does not have dynamic registration for formatting
      if vim.fn.has("nvim-0.10") == 0 then
        LazyVim.lsp.on_attach(function(client, _)
          client.server_capabilities.documentFormattingProvider = true
        end, "yamlls")
      end
    end,
  },
}
