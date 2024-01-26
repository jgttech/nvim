local map = vim.keymap.set

return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup()

    map("n", "<leader>tr", "<cmd>Trouble<cr>", { desc = "Open the trouble menu" })
    map("n", "<leader>tc", "<cmd>TroubleClose<cr>", { desc = "Close the trouble menu" })
  end,
}
