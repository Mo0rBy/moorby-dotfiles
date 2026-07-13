return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim"
  },
  -- Not loaded at startup: lspconfig lists mason as a dependency, so it loads on
  -- BufReadPre (before any LSP server spawns, ensuring mason's bin dir is on
  -- PATH). cmd lets `:Mason` etc. load it standalone from the dashboard.
  cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog", "MasonUpdate" },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "bashls",
        "cssls",
        "dockerls",
        "docker_compose_language_service",
        "eslint",
        "gopls",
        "groovyls",
        "html",
        "helm_ls",
        "jsonls",
        "java_language_server",
        "ts_ls",
        "lua_ls",
        "marksman",
        "pyright",
        "terraformls",
        "tflint",
        "yamlls",
      },
      automatic_installation = false,  -- do not auto-install LSP servers for languages not already installed when relevant file type is opened
      automatic_enable = false
    })
  end
}
