local onsave = true
local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

require "custom.options"
if onsave then
  require "custom.configs.format_onsave"
end
