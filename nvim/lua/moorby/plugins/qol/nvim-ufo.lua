return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
    "luukvbaal/statuscol.nvim",
  },
  event = "VeryLazy",
  config = function()
    -- set vim options
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
    vim.o.foldcolumn = "1" -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    local virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local totalLines = vim.api.nvim_buf_line_count(0)
      local foldedLines = endLnum - lnum
      local suffix = (" 󰁂 %d %d%%"):format(foldedLines, foldedLines / totalLines * 100)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      local rAlignAppndx =
        math.max(math.min(vim.opt.textwidth["_value"], width - 1) - curWidth - sufWidth, 0)
      suffix = (" "):rep(rAlignAppndx) .. suffix
      table.insert(newVirtText, { suffix, "MoreMsg" })
      return newVirtText
    end

    -- configure plugin options
    require("ufo").setup({
      fold_virt_text_handler = virt_text_handler,
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
    })

    -- setup keymaps
    vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
    vim.keymap.set("n", "zK", function()
      local winid = require("ufo").peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end, { desc = "Peek Fold" })

    -- TODO: Remove these, no longer using neogit
    -- Disable folding in NeoGit windows
    vim.api.nvim_create_augroup("nvim-ufo_neogit", { clear = true })

    vim.api.nvim_create_autocmd(
      "FileType",
      {
        group = "nvim-ufo_neogit",
        pattern = "Neogit",
        callback = function()
          require("ufo").detach()
          vim.opt_local.foldenable = false
          vim.wo.foldcolumn = "0"
        end
      }
    )

    -- Disable folding in select filetypes
    vim.api.nvim_create_augroup("nvim-ufo_files", { clear = true })

    vim.api.nvim_create_autocmd(
      "FileType",
      {
        group = "nvim-ufo_files",
        pattern = "markdown",
        callback = function()
          require("ufo").detach()
          vim.opt_local.foldenable = false
          vim.wo.foldcolumn = "0"
        end
      }
    )

  end,
}
