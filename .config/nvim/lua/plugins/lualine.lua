return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Change the separators to NvChad's rounded ones
    opts.options = opts.options or {}
    -- These are the subtle dividers between components
    opts.options.component_separators = { left = "", right = "" }
    -- These are the prominent section dividers
    opts.options.section_separators = { left = "", right = "" }

    return opts
  end,
}
