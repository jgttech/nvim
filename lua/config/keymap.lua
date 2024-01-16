keymap({
  -- Formatting
  { "n", "<leader>f", vim.lsp.buf.format },

  -- Better window navigation
  { "n", "<C-h>", "<C-w>h" },
  { "n", "<C-j>", "<C-w>j" },
  { "n", "<C-k>", "<C-w>k" },
  { "n", "<C-l>", "<C-w>l" },

  -- Resizing windows with arrows
  -- { "n", "<C-Up>", ":resize +1<cr>" },
  -- { "n", "<C-Down>", ":resize +1<cr>" },
  -- { "n", "<C-Left>", ":vertical resize -1<cr>" },
  -- { "n", "<C-Right>", ":vertical resize +1<cr>" },

  -- Switch buffers
  { "n", "<S-l>", ":bnext<cr>" },
  { "n", "<S-h>", ":bprevious<cr>" },

  -- Stay in visual indent mode
  { "v", "<", "<gv" },
  { "v", ">", ">gv" },

  -- For moving lines up or down.
  { "v", "J", ":m '>+1<CR>gv=gv" },
  { "v", "K", ":m '<-2<CR>gv=gv" },

  { "x", "p", [["_dP]] },

  -- Remaps from ThePrimeagon on YouTube
  { { "n", "v" }, "<leader>y", [["+y]] },
  { "n", "<leader>Y", [["+Y]] },
  { { "n", "v" }, "<leader>d", [["_d]] },

  -- Cancel insert mode
  { "i", "<C-c>", "<Esc>" },

  -- Disable capital Q
  { "n", "Q", "<nop>" },

  { "n", "<leader>sa", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]] },
  { "n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true } },

  -- window management
  { "n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" } },
  { "n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" } },
  { "n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" } },
  { "n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" } },

  -- clear search highlights
  { "n", "<leader>ch", ":nohl<CR>", { desc = "Clear search highlights" } },

  -- nvim-tree focus
  { "n", "<leader>tt", "<cmd>NvimTreeFocus<cr>", { desc = "Focus to the nvim-tree" } },

  -- buffer comamnds
  { "n", "<leader>q", "<cmd>Bdelete this<cr>", { desc = "Close the current buffer" } },
  { "n", "<leader>bo", "<cmd>Bdelete other<cr>", { desc = "Close all buffers except current one" } },
  { "n", "<leader>bm", "<cmd>Bdelete menu<cr>", { desc = "Interactively choose how to delete buffers" } },

  -- Markdown preview comamnds
  { "n", "<leader>mp", "<cmd>MarkdownPreview<cr>", { desc = "Run the markdown preview" } },
  { "n", "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", { desc = "Run the markdown preview stop" } },
})
