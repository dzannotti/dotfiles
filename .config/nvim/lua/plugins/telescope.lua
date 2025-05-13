local Util = require("lazyvim.util")

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fG",
        function()
          require("telescope.builtin").find_files({
            find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git" },
          })
        end,
        desc = "Find files (including hidden)",
      },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find text (grep)" },
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
}
