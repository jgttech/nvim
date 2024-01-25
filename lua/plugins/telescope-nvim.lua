-- Preloads the "builtin" and "themes" modules from
-- building the keymap functions.
local key = function(keymap_callback)
  return function()
    local builtin = require('telescope.builtin')
    local themes = require('telescope.themes')

    if keymap_callback then
      keymap_callback(builtin, themes)
    end
  end
end

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-media-files.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build =
      "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
  },
  keys = {
    {
      desc = "Show buffers",
      "<leader><space>",
      key(function(builtin, themes)
        builtin.buffers(themes.get_dropdown({
          previewer = false,
          layout_config = {
            width = 0.6,
            height = 0.75,
          },
        }))
      end),
    },
    {
      desc = "Find files",
      "<leader>ff",
      key(function(builtin)
        builtin.find_files({
          previewer = false,
          layout_config = {
            width = 0.5,
          },
        })
      end),
    },
    {
      desc = "Find git files",
      "<leader>fg",
      key(function(builtin)
        builtin.git_files({
          previewer = false,
          layout_config = {
            width = 0.5,
          },
        })
      end),
    },
    {
      desc = "Find keymaps",
      "<leader>fk",
      key(function(builtin)
        builtin.keymaps()
      end),
    },
    {
      desc = "Find help",
      "<leader>fh",
      key(function(builtin)
        builtin.help_tags()
      end),
    },
    {
      desc = "Find current word/string",
      "<leader>fw",
      key(function(builtin)
        builtin.grep_string({
          layout_config = {
            width = 0.9,
          },
        })
      end),
    },
    {
      desc = "Find live search",
      "<leader>fs",
      key(function(builtin)
        builtin.live_grep({
          layout_config = {
            width = 0.9,
          },
        })
      end),
    },
    {
      desc = "Find diagnostics",
      "<leader>fd",
      key(function(builtin)
        builtin.diagnostics()
      end),
    },
    {
      desc = "Fuzzily search in current buffer",
      "<leader>/",
      key(function(builtin, themes)
        builtin.current_buffer_fuzzy_find(themes.get_dropdown({
          winblend = 10,
          previewer = false,
          layout_config = {
            width = 0.6,
            height = 0.9,
          },
        }))
      end),
    },
    {
      desc = "Find media files",
      "<leader>fm",
      function()
        local ok, telescope = import.use({ "telescope" })

        if ok then
          telescope.extensions.media_files.media_files({
            layout_config = {
              width = 0.9,
              height = 0.9,
            },
          })
        end
      end,
    },
    {
      desc = "Find recent files",
      "<leader>fr",
      key(function(builtin, themes)
        builtin.oldfiles(themes.get_dropdown({
          previewer = false,
          layout_config = {
            width = 0.7,
            height = 0.9,
          },
        }))
      end),
    },
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        file_ignore_patterns = {
          "node%_modules/.*",
        },
        path_display = { "truncate" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          case_mode = "smart_case",
        },
        media_files = {
          filetypes = { "png", "webp", "jpg", "jpeg", "webm", "pdf" },
          find_cmd = "rg",
        },
      },
    })

    telescope.load_extension("media_files")
    telescope.load_extension("fzf")
  end
}
