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

      if telescope and builtin then
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
          { "n", "<leader><space>", builtin.buffers },
          { "n", "<leader>ff",      builtin.find_files },
          { "n", "<leader>gf",           builtin.git_files },
          { "n", "<leader>ps",
            function()
              builtin.grep_string({ search = vim.fn.input("Grep > ") });
            end
          }
        })
      end
    end
  }
}
