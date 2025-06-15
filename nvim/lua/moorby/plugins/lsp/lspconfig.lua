return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    "smjonas/inc-rename.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- copy ensure_installed list from mason.lua
    -- this will be used to setup all the LSP's that are installed
    local ensure_installed = {
      "bashls",
      "cssls",
      "dockerls",
      "docker_compose_language_service",
      "eslint",
      "flux_lsp",
      "gopls",
      "groovyls",
      "html",
      -- "htmx",
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
    }

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = ' ',
          [vim.diagnostic.severity.WARN] = ' ',
          [vim.diagnostic.severity.HINT] = '󰠠 ',
          [vim.diagnostic.severity.INFO] = ' ',
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
          [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
          [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
          [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
        }
      },
    })

    local keymap = vim.keymap

    local opts = { noremap = true, silent = true }
    -- the on_attach function will execute when attached to new buffers that the LSP server starts on
    local on_attach = function(client, buffer)
      opts.buffer = bufnr

      -- set keymaps
      keymap.set("n", "<leader>lR", "<cmd>Telescope lsp_references<CR>", {desc = "Show LSP references"})
      keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, {desc = "Go to declaration"})
      keymap.set("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", {desc = "Show LSP definitions"})
      keymap.set("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", {desc = "Show LSP implementations"})
      keymap.set("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", {desc = "Show LSP type definitions"})
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", {desc = "Show buffer diagnostics"})
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, {desc = "Show line diagnostics"})
      keymap.set("n", "[d", vim.diagnostic.goto_prev, {desc = "Go to previous diagnostics"})
      keymap.set("n", "]d", vim.diagnostic.goto_next, {desc = "Go to next diagnostic"})
      keymap.set("n", "K", vim.lsp.buf.hover, {desc = "Show documentation for what is under the cursor"})
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {desc = "See available code actions"}) -- in visual mode, this will apply to the current selection
      keymap.set("n", "<leader>rn", function() return ":IncRename " .. vim.fn.expand("<cword>") end, { desc = "Smart rename", expr = true }) -- depends on inc-rename plugin
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", {desc = "Restart LSP"})
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    for _, lsp in pairs(ensure_installed) do
      if (lsp == "lua_ls") then -- configure lua_ls with special settings
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.stdpath("config") .. "/lua"] = true,
                }
              }
            }
          }
        })

      elseif (lsp == "helm_ls") then -- configure helm_ls with special settings
        lspconfig["helm_ls"].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = {
            ["helm-ls"] = {
              yamlls = {
                enabled = false
              }
            }
          }
        })

      elseif (lsp == "groovyls") then -- configure groovyls with special settings
        lspconfig["groovyls"].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          cmd = { "groovy-language-server" },
        })

      elseif (lsp == "java_language_server") then -- configure java_language_server with special settings
        lspconfig["java_language_server"].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          cmd = { "java-language-server" },
        })


      else -- add more conditionals for other LSP's if required
        lspconfig[lsp].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end
    end
  end
}
