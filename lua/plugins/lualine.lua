return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = import("lualine")

    if lualine then
      lualine.setup()
    end
  end
}
