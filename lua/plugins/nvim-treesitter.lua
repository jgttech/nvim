return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",
    "folke/neodev.nvim",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      ensure_installed = {
        "bash",
        "c",
        "comment",
        "css",
        "elixir",
        "gitattributes",
        "gitignore",
        "gitcommit",
        "go",
        "html",
        "javascript",
        "json5",
        "jsonc",
        "lua",
        "python",
        "prisma",
        "rust",
        "sql",
        "tsx",
        "yaml",
        "vim",
        "vimdoc",
        "query",
        "zig",
      },
    })
  end,
}
