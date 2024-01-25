return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "jay-babu/mason-null-ls.nvim",
    "L3MON4D3/LuaSnip",
    "nvimtools/none-ls.nvim",
  },
  config = function()
    require("plugins.lsp.mason")
    require("plugins.lsp.lua_ls")
    require("plugins.lsp.cmp")
    require("plugins.lsp.none-ls")
  end,
}
