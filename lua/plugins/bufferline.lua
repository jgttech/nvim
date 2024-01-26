return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      -- mode = "tabs",
      diagnostics = "nvim_lsp",
      separator_style = "thin",
      always_show_bufferline = true,
      extensions = {
        "nvim-tree",
      },
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          separator = false,
          text_align = "center",
        },
      },
    },
  },
}
