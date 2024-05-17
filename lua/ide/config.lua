local config = require 'ide.utils.autoload' 'ide.config'

if vim.fn.has 'termguicolors' == 1 then
  vim.o.termguicolors = true
end

-- Just add the name of the confguration file that needs
-- to be loaded.
config {
  'settings',
  'autocmd',
  'keymap',
}
