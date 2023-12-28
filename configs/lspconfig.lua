local config = require "plugins.configs.lspconfig"
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require "lspconfig"

function organize_imports()
  print "Organize Imports command called"
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    },
  },
}

-- configure emmet language server
lspconfig["emmet_ls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
}

lspconfig["intelephense"].setup {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
  capabilities = capabilities,
}

-- configure default formats
local servers = { "gopls", "html", "cssls", "tailwindcss" }
for _, lsp in pairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end
