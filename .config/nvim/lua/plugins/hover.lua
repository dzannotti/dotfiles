return {
  "lewis6991/hover.nvim",
  config = function()
    require("hover").setup({
      init = function()
        -- You can configure additional providers here if you want
        require("hover.providers.lsp")
        require("hover.providers.man")
        require("hover.providers.dictionary")
      end,
      preview_opts = {
        border = nil,
      },
      title = true,
    })

    -- Keybindings for Hover.nvim
    vim.keymap.set("n", "K", require("hover").hover, { desc = "Hover Info" })
    vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "Select Hover" })
  end,
}
