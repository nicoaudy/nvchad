local M = {}

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

M.general = {
  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
  },
  v = {
    -- Move text up and down
    ["<A-j>"] = { ":m .+1<CR>==", opts },
    ["<A-k>"] = { ":m .-2<CR>==", opts },
    ["p"] = { '"_dP', opts },
    ["J"] = { ":move '>+1<CR>gv-gv", " ", opts },
    ["K"] = { ":move '<-2<CR>gv-gv", " ", opts },
  },
  n = {
    ["x"] = { '"_x', opts }, -- Do not yank with x
    ["+"] = { "<C-a>", opts }, -- Increment/decrement
    ["-"] = { "<C-x>", opts },
    ["db"] = { 'vb"_d', opts }, -- Delete a word backwards
    ["<C-a>"] = { "gg<S-v>G", opts }, -- Delete a word backwards
    ["ss"] = { ":split<Return><C-w>w", opts }, -- Split window
    ["sv"] = { ":vsplit<Return><C-w>w", opts },

    -- Move text up and down
    ["<A-j>"] = { "<Esc>:m .+1<CR>==gi", opts },
    ["<A-k>"] = { "<Esc>:m .-2<CR>==gi", opts },

    -- Navigate buffers
    ["<S-l>"] = { ":bnext<CR>", opts },
    ["<S-h>"] = { ":bprevious<CR>", opts },
    ["<C-f>"] = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", " ", opts },
  },
  x = {
    -- Move text up and down
    ["J"] = { ":move '>+1<CR>gv-gv", opts },
    ["K"] = { ":move '<-2<CR>gv-gv", opts },
    ["<A-j>"] = { ":move '>+1<CR>gv-gv", opts },
    ["<A-k>"] = { ":move '<-2<CR>gv-gv", opts },
  },
  t = {
    -- Better terminal navigation
    ["<C-h>"] = { "<C-\\><C-N><C-w>h", term_opts },
    ["<C-j>"] = { "<C-\\><C-N><C-w>j", term_opts },
    ["<C-k>"] = { "<C-\\><C-N><C-w>k", term_opts },
    ["<C-l>"] = { "<C-\\><C-N><C-w>l", term_opts },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<C-\\>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<C-\\>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
  },
}

return M
