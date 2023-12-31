-- Allows me to map many keys using the Lua tables
-- to manage the configuration without needing to call
-- the vim function over and over.
keymap = function(maps)
  for _, map in pairs(maps) do
    vim.keymap.set(map[1], map[2], map[3], map[4] or {})
  end
end
