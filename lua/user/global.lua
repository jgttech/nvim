-- Does a protected import of whatever module with an optional
-- callback handler function. If the module is unnable to be
-- loaded, is will print a message for that module, attempt to
-- call the callback handler, and return "nil" from the function.
import = function(path, cb)
  local ok, mod = pcall(require, path)

  if not ok then
    vim.notify("Require Error: " .. path)

    if cb then
      cb()
    end

    return nil
  end

  return mod
end

keymap = function(maps)
  for _, map in pairs(maps) do
    vim.keymap.set(map[1], map[2], map[3], map[4] or {})
  end
end
