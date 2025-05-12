return {
  {
    "folke/flash.nvim",
    keys = {
      { "s", false }, -- Disable the default 's' key
      {
        "<leader>fs",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash Jump",
      },
      {
        "<leader>ft",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  },
}

