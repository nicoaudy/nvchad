local null_ls = require "null-ls"

local b = null_ls.builtins
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {

  -- webdev stuff
  b.formatting.prettierd,
  b.diagnostics.eslint_d,

  b.formatting.phpcsfixer,

  -- Lua
  b.formatting.stylua,

  -- Go
  b.formatting.gofmt,
  b.formatting.goimports,
  b.formatting.goimports_reviser,
}

null_ls.setup {
  debug = true,
  sources = sources,
  temp_dir = "/tmp/null-ls",
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        desc = "Auto format before save",
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
