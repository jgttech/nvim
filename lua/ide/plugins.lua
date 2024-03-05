local plugins = require 'ide.utils.autoload'('ide.plugins', true)

-- List of the Lua modules that are loaded.
-- This list can be either just a string or a <key = value> pair
-- were the key is the name of the *.lua file and the value is
-- a boolean flag. By DEFAULT all the modules listed are enabled
-- (true). However, if one needs to be disabled, this can be done
-- by setting it to "false".
return plugins {
  -- Just to make switching themes easier and avoid loading themes
  -- I am not using, I am setting these up to be easily enabled and
  -- disabled by formatting them for it.
  ['tokyonight'] = false,
  ['kanagawa'] = true,

  'alpha',
  'bufferline',
  'autopairs',
  'dressing',
  'lualine',
  'vim-sleuth',
  'comment',
  'gitsigns',
  'which-key',
  'telescope',
  'lspconfig',
  'conform',
  'cmp',
  'todo-comments',
  'mini',
  'treesitter',
  'treesitter-textobjects',
  'maximizer',
  'scrollbar',
  'toggleterm',
  'markdown-preview',
  'neo-tree',

  -- If I want to import from a supplied path I can prefix
  -- the path with "@" and the "plugins" function will use
  -- whatever comes after the "@" as the required Lua module
  -- path.
  '@kickstart.plugins.debug',
  '@kickstart.plugins.indent_line',
}
