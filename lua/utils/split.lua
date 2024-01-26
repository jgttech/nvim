local function split(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end

  local tokens={}

  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(tokens, str)
  end

  return tokens
end

return split

