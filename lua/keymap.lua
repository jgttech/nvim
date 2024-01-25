local map = vim.keymap.set

-- note: diagnostics are not exclusive to lsp servers
-- so these can be global keybindings
map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")

-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Window management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Switch buffers
map("n", "<S-l>", ":bnext<cr>")
map("n", "<S-h>", ":bprevious<cr>")

-- Stay in visual indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- For moving lines up or down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("x", "p", [["_dP]])

-- Remaps from ThePrimeagon on YouTube
map({ "n", "v" }, "<leader>y", [["+y]])
map({ "n", "v" }, "<leader>d", [["_d]])
map("n", "<leader>Y", [["+Y]])

-- Cancel insert mode
map("i", "<C-c>", "<Esc>")

-- Disable capital "Q"
map("n", "Q", "<nop>")

-- Search and replace
map("n", "<leader>sa", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Clear search highlights
map("n", "<leader>ch", ":nohl<CR>", { desc = "Clear search highlights" })

-- Make active file buffer executable
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- NvimTree focus
map("n", "<leader>tt", "<cmd>NvimTreeFocus<cr>", { desc = "Focus to the nvim-tree" })

-- Buffer commands
map("n", "<leader>q", "<cmd>Bdelete this<cr>", { desc = "Close the current buffer" })
map("n", "<leader>bo", "<cmd>Bdelete other<cr>", { desc = "Close all buffers except current one" })
map("n", "<leader>bm", "<cmd>Bdelete menu<cr>", { desc = "Interactively choose how to delete buffers" })

-- Markdown preview commands
map("n", "<leader>mp", "<cmd>MarkdownPreview<cr>", { desc = "Run the markdown preview" })
map("n", "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", { desc = "Run the markdown preview stop" })
