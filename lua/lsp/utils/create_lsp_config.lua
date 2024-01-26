local function create_lsp_config(on_attach_callback)
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  -- The pre-bound buffer options callback
  local from_options = function(bufnr)
    return function(desc)
      return {
        noremap = true,
        silent = true,
        buffer = bufnr,
        desc = desc,
      }
    end
  end

  -- The generated default options
  local from_defaults = function()
    return {
      capabilities = capabilities,
      on_attach = function(_, bufnr)
        local options = from_options(bufnr)

        if on_attach_callback then
          on_attach_callback(options)
        end
      end,
    }
  end

  -- Primary configuration function for each LSP setup.
  local configure = function(config)
    config = config or {}
    local default_config = from_defaults()
    local server_config = vim.tbl_deep_extend("force", default_config, config)

    return server_config
  end

  return configure
end

return create_lsp_config
