return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = import.config(function(use)
    local ok, term = use({ "toggleterm" })

    if ok then
      term.setup({
        open_mapping = [[<c-\>]],
        direction = "float",
        auto_scroll = true,
        float_opts = {
          border = "curved",
          winblend = 3,
        },
      })
    end
  end),
}
