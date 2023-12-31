-- Need to load the utilities and vim configuration
-- before we load Lazy.nvim.
require("utils.import")
require("utils.keymap")
require("config.vim")
require("config.keymap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")

lazy.setup({
  { import = "plugins" },
  { import = "plugins.lsp" },
}, {
  install = {
    colorscheme = { "kanagawa" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})

-- Loaded after Lazy.nvim loads so that we can use
-- a single centralized location to configure settings
-- for things like themes, etc, in Neovim. These
-- are not necessarily tied to plugins so I did not
-- place this file in the "after/plugin" directory for
-- that reason.
require("config.settings")
