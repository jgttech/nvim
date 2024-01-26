local function stringify(data)
  local result

  for key, value in ipairs(data or {}) do
    -- prepare json key-value pairs and save them in separate table
    table.insert(result, string.format('"%s":%s', key, value))
  end

  -- get simple json string
  return "{" .. table.concat(result, ",") .. "}"
end

return stringify
