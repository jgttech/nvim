-- This laods the configuration files in the
-- order that they are defiend. This avoids having
-- to repeatedly do "config <thing>" for each
-- configuration I am trying to manage. If I decide
-- to change the way they load or how they are broken
-- up, in the future, I can easily change that structure
-- without adding more code.
local function config(list)
  local basePath = 'ide.config.'

  for _, plugin in ipairs(list) do
    require(basePath .. plugin)
  end
end

return config
