local map = vim.keymap.set

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antosha417/nvim-lsp-file-operations",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lsp-file-operations").setup()
    require("nvim-tree").setup({
      trash = {
        cmd = "gio trash",
      },
      view = {
        -- width = 45,
        relativenumber = true,
        adaptive_size = true,
      },
      -- change folder arrow icons
      renderer = {
        highlight_git = true,
        highlight_diagnostics = true,
        indent_markers = {
          enable = true,
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        enable = true,
        ignore = false,
      },
      update_focused_file = {
        enable = true,
      },
    })

    -- Change color for arrows in the tree
    vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#7E9CD8 ]])
    vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#7E9CD8 ]])

    map("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    map("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
    map("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
    map("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
    map("n", "<S-Right>", "<cmd>NvimTreeResize +1<cr>", { desc = "Increase the file explorer size" })
    map("n", "<S-Left>", "<cmd>NvimTreeResize -1<cr>", { desc = "Increase the file explorer size" })
  end,
}
