local null_ls = require "null-ls"

local b = null_ls.builtins
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.deno_fmt.with {
    condition = function(u)
      return u.root_has_file { "deno.json" }
    end,
  },
  -- b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes
  b.formatting.prettier,

  b.diagnostics.eslint,
  b.formatting.phpcsfixer,

  -- Lua
  b.formatting.stylua,
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
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
