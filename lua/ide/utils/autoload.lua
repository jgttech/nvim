-- Serves as a function that accepts a "basePath" string
-- and returns a function that accepts a list of toggleable
-- paths that can are passed as "require" string arguments
-- for each autoload required Lua module.
--
-- If the "shouldReturn" property is set to "true" is will merge
-- the results of the require operations into a table and return
-- the table.
local function autoload(basePath, shouldReturn)
  local function autoload_from(list)
    local addons = {}

    for key, name in pairs(list) do
      if name ~= false then
        local plugin = key

        if type(key) == 'number' then
          plugin = name
        end

        local directive = string.sub(plugin, 1, 1)

        if directive ~= '@' then
          local relativePath = basePath .. '.' .. plugin

          if shouldReturn then
            table.insert(addons, require(relativePath))
          else
            require(relativePath)
          end
        else
          local absolutePath = string.sub(plugin, 2, string.len(plugin))

          if shouldReturn then
            table.insert(addons, require(absolutePath))
          else
            require(absolutePath)
          end
        end
      end
    end

    return addons
  end

  return autoload_from
end

return autoload
