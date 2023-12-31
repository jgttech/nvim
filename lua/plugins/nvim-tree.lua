return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = import.config(function(use)
      local ok, nvimtree = use({ "nvim-tree" })

      if ok then
        -- Change color for arrows in the tree
        vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#7E9CD8 ]])
        vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#7E9CD8 ]])

        -- configure nvim-tree
        nvimtree.setup({
          view = {
            width = 45,
            relativenumber = true,
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

        keymap({
          { "n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" } },
          {
            "n",
            "<leader>ef",
            "<cmd>NvimTreeFindFileToggle<CR>",
            { desc = "Toggle file explorer on current file" },
          },
          { "n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" } },
          { "n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" } },
          { "n", "<S-Right>", "<cmd>NvimTreeResize +1<cr>", { desc = "Increase the file explorer size" } },
          { "n", "<S-Left>", "<cmd>NvimTreeResize -1<cr>", { desc = "Increase the file explorer size" } },
        })
      end
    end),
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = true,
  },
}
