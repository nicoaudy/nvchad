local map = vim.keymap.set
local unmap = vim.keymap.del

-- General mappings
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { nowait = true })

-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==")
map("v", "<A-k>", ":m .-2<CR>==")
map("v", "p", '"_dP')
map("v", "J", ":move '>+1<CR>gv-gv")
map("v", "K", ":move '<-2<CR>gv-gv")

map("n", "x", '"_x') -- Do not yank with x
map("n", "+", "<C-a>") -- Increment
map("n", "-", "<C-x>") -- Decrement
map("n", "db", 'vb"_d') -- Delete a word backwards
map("n", "<C-a>", "gg<S-v>G") -- Select all

map("n", "<C-a>", "gg<S-v>G") -- Select all
map("n", "ss", ":split<Return><C-w>w") -- Split window horizontally
map("n", "sv", ":vsplit<Return><C-w>w") -- Split window vertically

-- Fix for vim-tmux-navigator conflicts with nvchad
unmap("n", "<c-h>")
unmap("n", "<c-j>")
unmap("n", "<c-k>")
unmap("n", "<c-l>")
map("n", "<c-h>", "<cmd>:TmuxNavigateLeft<cr>")
map("n", "<c-j>", "<cmd>:TmuxNavigateDown<cr>")
map("n", "<c-k>", "<cmd>:TmuxNavigateUp<cr>")
map("n", "<c-l>", "<cmd>:TmuxNavigateRight<cr>")
map("n", "<c-\\>", "<cmd>:TmuxNavigatePrevious<cr>")

-- Move text up and down in normal mode
map("n", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("n", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

-- Format buffer
map("n", "<C-f>", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", { desc = "Format buffer" })

-- Move text up and down in visual mode
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "<A-j>", ":move '>+1<CR>gv-gv")
map("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Better terminal navigation
map("t", "<C-h>", "<C-\\><C-N><C-w>h")
map("t", "<C-j>", "<C-\\><C-N><C-w>j")
map("t", "<C-k>", "<C-\\><C-N><C-w>k")
map("t", "<C-l>", "<C-\\><C-N><C-w>l")

-- NvimTree toggle
map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle nvimtree" })

-- NvTerm toggle
map({ "n", "t" }, "<C-]>", function()
  require("nvterm.terminal").toggle "float"
end, { desc = "Toggle floating terminal" })
