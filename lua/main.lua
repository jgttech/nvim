-- I have opted to each package manager to have its
-- own directory in the "plugins" directory where the
-- "init.lua" file is responsible for the setup work
-- for that package manager.
--
-- If I wanted to use "packer.nvim" instead I would have
-- a "plugins/packer/init.lua" file with the plugins for
-- Packer seutp in that directory exclusively for Packer.
-- This way I can switch package managers, if I decide to,
-- down the road.
require "plugins.lazy"

-- Everything after the package manager plugins are
-- invoked is whatever else that is NOT package manager
-- specific.
require "settings"
require "config"