return {
  {
    "nvim-telescope/telescope.nvim",
    -- Keep your existing custom mappings
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
      -- Explicitly remove the <leader><leader> mapping by setting it to false
      { "<leader><leader>", false },
    },
  },
}
