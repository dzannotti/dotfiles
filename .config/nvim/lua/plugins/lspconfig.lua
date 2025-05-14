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

    return opts
  end,
}
