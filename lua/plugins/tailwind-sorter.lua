return {
  "laytan/tailwind-sorter.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
  build = "cd formatter && npm i && npm run build",
  lazy = true,
  config = function()
    require("tailwind-sorter").setup({
      on_save_pattern = { "*.html", "*.jsx", "*.tsx", "*.js", ".ts" },
    })
  end,
}
