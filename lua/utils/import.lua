local use = function(dependencies_table)
  -- The overall "ok" boolean status of loading all
  -- the dependencies. This will get set to "false"
  -- if something fails.
  local ok = true

  -- This is where we hold all the dependencies after trying to load them.
  local mods = {}

  for _, dependency in ipairs(dependencies_table) do
    -- Attempt to load a module and put the module load
    -- status into the table containing all the loaded
    -- dependencies.
    local valid, mod = pcall(require, dependency)

    if not valid then
      vim.notify("REQUIRE FAILED: " .. dependency)

      if ok then
        ok = false
      end

      mod = nil
    end

    table.insert(mods, mod)
  end

  return ok, table.unpack(mods)
end

import = {
  use = use,

  -- The purpose of this basic utility is to do protected imports
  -- of plugins that we want to use. If there is a problem with
  -- configuration a plugin where something happens and it does
  -- not properly load, it was misspelled, or something like that
  -- we will see a message telling us that there was an issue with
  -- the module that was attemping to be loaded.
  config = function(config_fn)
    return function(...)
      if config_fn then
        config_fn(use, ...)
      end
    end
  end,
}
