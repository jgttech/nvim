-- User defined lua scripts to run before Lazy.
require("user.global")
require("user.settings")
require("user.remap")

-- The lazy plugin initialization.
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

-- Initialize Lazy
local lazy = import("lazy")

if lazy then
  lazy.setup("plugins")
end
