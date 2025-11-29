return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim"
  },
  lazy = false,
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
