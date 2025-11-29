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

    -- copy ensure_installed list from mason.lua
    -- this will be used to setup all the LSP's that are installed
    local ensure_installed = {
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

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function()
        -- set keymaps
        keymap.set("n", "<leader>lR", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references", noremap = true, silent = true })
        keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, { desc = "Go to declaration", noremap = true, silent = true })
        keymap.set("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", {desc = "Show LSP definitions", noremap = true, silent = true })
        keymap.set("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show LSP implementations", noremap = true, silent = true })
        keymap.set("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Show LSP type definitions", noremap = true, silent = true })
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Show buffer diagnostics", noremap = true, silent = true })
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics", noremap = true, silent = true })
        keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Go to previous diagnostics", noremap = true, silent = true })
        keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Go to next diagnostic", noremap = true, silent = true })
        keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation for what is under the cursor", noremap = true, silent = true })
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions", noremap = true, silent = true }) -- in visual mode, this will apply to the current selection
        keymap.set("n", "<leader>rn", function() return ":IncRename " .. vim.fn.expand("<cword>") end, { desc = "Smart rename", expr = true , noremap = true, silent = true }) -- depends on inc-rename plugin
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP", noremap = true, silent = true })
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local has_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
    if has_cmp_nvim_lsp then
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    end

    vim.lsp.config('*', {
      capabilities = capabilities
    })

    -- add any LSP's to this list if the need additional or specific settings
    for _, lsp in pairs(ensure_installed) do
      if (lsp == "lua_ls") then
        vim.lsp.config(lsp, {
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

      elseif (lsp == "helm_ls") then
        vim.lsp.config(lsp, {
          settings = {
            ["helm-ls"] = {
              yamlls = {
                enabled = false
              }
            }
          }
        })

      elseif (lsp == "groovyls") then
        vim.lsp.config(lsp, {
          cmd = { "groovy-language-server" },
        })

      elseif (lsp == "java_language_server") then
        vim.lsp.config(lsp, {
          cmd = { "java-language-server" },
        })

      end
    end

    vim.lsp.enable(ensure_installed)
  end
}
