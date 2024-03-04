-- Takes a list of strings. The strings are 2 possible
-- types. Either regular strings, which get prefixed with
-- the "basePath" or strings that have an "@" in the first
-- character, which indicates that I am supplying the full
-- required path for that Lua module and do NOT prefix this
-- particular path.
--
-- This gives me clear and easy to read control over the way
-- Lazy loads the modules, making things more deterministic,
-- for me.
--
-- Another benefit I get from this that if the Kickstart project
-- that TJ made does change in any significant way by having
-- more Lua modules added to it later on, I am control if/when
-- they actually get applied from within my own IDE config.
local function plugins(list)
  local basePath = 'ide.plugins.'
  local addons = {}

  for key, name in pairs(list) do
    if name ~= false then
      local plugin = key

      if type(key) == 'number' then
        plugin = name
      end

      local directive = string.sub(plugin, 1, 1)

      if directive ~= '@' then
        table.insert(addons, require(basePath .. plugin))
      else
        local path = string.sub(plugin, 2, string.len(plugin))

        table.insert(addons, require(path))
      end
    end
  end

  return addons
end

return plugins
