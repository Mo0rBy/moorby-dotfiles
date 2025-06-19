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
        -- "htmx", -- leaving this out for now as it does not install correctly and it looks to be a very new LSP server
        "helm_ls",
        "jsonls",
        "java_language_server",
        "quick_lint_js",
        "ts_ls",
        "jqls",
        "lua_ls",
        "marksman",
        "pyright",
        "terraformls",
        "tflint",
        "lemminx",
        "yamlls"
      },
      automatic_installation = false,  -- do not auto-install LSP servers for languages not already installed when relevant file type is opened
      automatic_enable = false
    })
  end
}
