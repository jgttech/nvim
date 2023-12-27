return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    local toggleterm = import("toggleterm")

    if toggleterm then
      toggleterm.setup({
        open_mapping = [[<c-\>]],
        autochdir = false,
        direction = 'float',
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = 'curved'
        },
        winbar = {
          enable = true
        }
      })
    end
  end,
}
