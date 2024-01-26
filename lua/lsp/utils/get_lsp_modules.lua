local function get_lsp_modules(dir)
  local utils = require("utils")
  local find = 'find "${HOME}/.config/nvim/lua/lsp/' .. dir .. '" -type f -maxdepth 1'
  local p = io.popen(find)
  local modules = {}

  for line in p:lines() do
    local sections = utils.split(line, "/")
    local filename = utils.split(sections[#sections], ".")[1]

    table.insert(modules, "lsp." .. dir .. "." .. filename)
  end

  return modules
end

return get_lsp_modules
