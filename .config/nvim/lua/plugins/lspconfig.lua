return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- Disable all inlay hints
    opts.inlay_hints = { enabled = false }

    -- Or if you want to be more specific and only disable parameter hints:
    -- if opts.inlay_hints then
    --   opts.inlay_hints.parameter_hints = { enabled = false }
    -- else
    --   opts.inlay_hints = { parameter_hints = { enabled = false } }
    -- end
    opts.on_attach = function(client, bufnr)
      local wk = require("which-key")
      local keymap = {
        g = {
          name = "Go To",
          d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
          D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
          r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
          i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
        },
        ["<leader>"] = {
          r = {
            name = "Refactor",
            n = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename Symbol" },
          },
          e = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
          q = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Quickfix Diagnostics" },
        },
        ["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Previous Diagnostic" },
        ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" },
      }

      wk.register(keymap, { buffer = bufnr })
    end
    return opts
  end,
}
