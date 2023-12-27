return {
  'AlexvZyl/nordic.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    local nordic = import('nordic')

    if nordic then
      nordic.load()
    end

    vim.cmd.colorscheme "nordic"
  end
}
