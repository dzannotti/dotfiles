return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup({
      -- Enable gopls configuration
      lsp_cfg = true,
      -- Configure gopls
      lsp_gofumpt = true,
      lsp_on_attach = function(client, bufnr)
        -- Enable signature help
        -- require("go.lsp").on_attach(client, bufnr)

        -- Explicitly mapping signature help
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr })
        vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr })
      end,
      lsp_document_formatting = true,
      -- Enable function signature/parameter hints
      gopls_cmd = { "gopls" },
      gopls_remote_auto = true,
      gopls_args = {
        "-remote=auto",
        "-remote.debug=:0",
        -- Add parameters to enable inlay hints
        "-hints=on",
      },
      -- More detailed settings for gopls
      gopls_settings = {
        gopls = {
          hints = {
            assignVariableTypes = false,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
          usePlaceholders = true,
          completionDocumentation = true,
          linksInHover = true,
          codelenses = {
            gc_details = true,
            test = true,
            tidy = true,
          },
        },
      },
    })
    -- Auto-trigger signature help on typing '(' in insert mode
    vim.api.nvim_create_autocmd("InsertCharPre", {
      pattern = "(",
      callback = function()
        vim.lsp.buf.signature_help()
      end,
    })

    -- Auto-trigger signature help when the cursor enters insert mode or after a pause
    vim.api.nvim_create_autocmd("InsertEnter", {
      pattern = "*.go",
      callback = function()
        vim.lsp.buf.signature_help()
      end,
    })

    vim.api.nvim_create_autocmd("CursorHold", {
      pattern = "*.go",
      callback = function()
        vim.lsp.buf.signature_help()
      end,
    })

    -- Run gofmt + goimport on save (keep your existing autocmd)
    local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        require("go.format").goimport()
      end,
      group = format_sync_grp,
    })
  end,
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()',
  keys = {
    -- Keep your existing key mappings
    { "<leader>gaj", "<cmd>GoAddTag<cr>", desc = "Add json tags" },
    { "<leader>gam", "<cmd>GoAddTag mapstructure<cr>", desc = "Add mapstructure tags" },
    { "<leader>gae", "<cmd>GoAddTag env<cr>", desc = "Add env tags" },
    { "<leader>gay", "<cmd>GoAddTag yaml<cr>", desc = "Add YAML tags" },
    { "<leader>gasvr", "<cmd>GoAddTag validate:required<cr>", desc = "Add Swagger validate required tags" },
    { "<leader>gasvo", "<cmd>GoAddTag validate:optional<cr>", desc = "Add Swagger validate optional tags" },
    { "<leader>gim", "<cmd>GoImplements<cr>", desc = "Find implementions of this method" },
    -- Add these new key mappings for signature help
    { "<leader>gsh", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Show signature help" },
    { "<leader>gca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code action" },
  },
}
