return {
  {
    "williamboman/mason.nvim",         -- LSP server installer
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "lua_ls", "gopls", "ts_ls", "pyright",
        "terraformls", "tflint",
        "jsonls", "yamlls", "taplo",
        "dockerls", "docker_compose_language_service",
        "bashls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "b0o/schemastore.nvim",             -- JSON/YAML schema catalog
    },
    config = function()
      -- Enable nvim-cmp completion capabilities for all servers
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Lua (suppress "undefined global vim" warning for neovim configs)
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })

      vim.lsp.config("gopls", { capabilities = capabilities })
      vim.lsp.config("ts_ls", { capabilities = capabilities })
      vim.lsp.config("pyright", { capabilities = capabilities })
      vim.lsp.config("terraformls", { capabilities = capabilities })

      -- JSON (auto-detects schemas for package.json, tsconfig.json, etc.)
      vim.lsp.config("jsonls", {
        capabilities = capabilities,
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })

      -- YAML (auto-detects schemas for k8s manifests, GitHub Actions, etc.)
      vim.lsp.config("yamlls", {
        capabilities = capabilities,
        settings = {
          yaml = {
            schemaStore = { enable = false, url = "" },
            schemas = require("schemastore").yaml.schemas(),
          },
        },
      })

      vim.lsp.config("taplo", { capabilities = capabilities })
      vim.lsp.config("dockerls", { capabilities = capabilities })
      vim.lsp.config("docker_compose_language_service", { capabilities = capabilities })
      vim.lsp.config("bashls", { capabilities = capabilities })
      vim.lsp.config("tflint", { capabilities = capabilities })

      vim.lsp.enable({
        "lua_ls", "gopls", "ts_ls", "pyright",
        "terraformls", "tflint",
        "jsonls", "yamlls", "taplo",
        "dockerls", "docker_compose_language_service",
        "bashls",
      })

      -- LSP keymaps (only active in buffers with a language server attached)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
          end
          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gr", vim.lsp.buf.references, "Go to references")
          map("K", vim.lsp.buf.hover, "Hover documentation")
          map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
        end,
      })
    end,
  },
}
