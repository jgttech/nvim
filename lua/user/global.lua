-- Does a protected import of whatever module with an optional
-- callback handler function. If the module is unable to be
-- loaded, is will print a message for that module, attempt to
-- call the callback handler, and return "nil" from the function.
import = function(name, cb)
  local ok, mod = pcall(require, name)

  if not ok then
    vim.notify("MODULE ERROR: " .. name)

    if cb then
      cb()
    end

    return nil
  end

  return mod
end

-- Allows me to map many keys using the Lua tables
-- to manage the configuration without needing to call
-- the vim function over and over.
keymap = function(maps)
  for _, map in pairs(maps) do
    vim.keymap.set(map[1], map[2], map[3], map[4] or {})
  end
end
