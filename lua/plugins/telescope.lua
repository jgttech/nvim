return {
  { 'nvim-lua/popup.nvim' },
  { 'nvim-telescope/telescope-media-files.nvim' },
  {
    'ahmedkhalf/project.nvim',
    config = function()
      local project_nvim = import("project_nvim")

      if project_nvim then
        project_nvim.setup({
          detection_methods = { "lsp" },
          show_hidden = true,
          datapath = vim.fn.stdpath("data"),
        })
      end
    end
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      local devicons = import("nvim-web-devicons")

      if devicons then
        devicons.setup()
      end
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local telescope = import('telescope')
      local builtin = import('telescope.builtin')
      local themes = import('telescope.themes')

      if telescope and builtin and themes then
        telescope.load_extension('media_files')
        telescope.load_extension('projects')

        telescope.setup({
          extensions = {
            media_files = {
              filetypes = { "png", "webp", "jpg", "jpeg", "webm", "pdf" },
              find_cmd = "rg"
            }
          },
        })

        keymap({
          { "n", "<leader><space>", builtin.buffers, { desc = '[ ] Show buffer' } },
          { "n", "<leader>sf",      builtin.find_files, { desc = '[S]earch [F]iles' }},
          { "n", "<leader>sg",      builtin.git_files, { desc = '[S]earch [G]it files' } },
          { "n", "<leader>sk", ":Telescope keymaps<cr>", { desc = "[S]earch [K]eymaps" } },
          { "n", "<leader>sh", builtin.help_tags, { desc = '[S]earch [H]elp' } },
          { "n", "<leader>sw", builtin.grep_string, { desc = '[S]earch current [W]ord' } },
          { "n", "<leader>sg", builtin.live_grep, { desc = '[S]earch by [G]rep' } },
          { "n", "<leader>sd", builtin.diagnostics, { desc = '[S]earch [D]iagnostics' } },
          { "n", "<leader>/",
            function()
              builtin. current_buffer_fuzzy_find(themes.get_dropdown {
                winblend = 10,
                previewer = false
              })
            end,
            { desc = '[/] Fuzzily search  in current buffer' }
          },
          { "n", "<leader>ss",
            function()
              builtin.grep_string({ search = vim.fn.input("Grep > ") });
            end,
            { desc = 'Grep search replace' }
          }
        })
      end
    end
  }
}
