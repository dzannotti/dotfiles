return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      go = { "goimports" },
    },
    formatters = {
      goimports = {
        args = { "-local", "mythos" },
      },
    },
  },
}
