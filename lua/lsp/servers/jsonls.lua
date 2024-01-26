return {
  setup = function(configure)
    local schemastore = require("schemastore")

    require("lspconfig").jsonls.setup(configure({
      settings = {
        json = {
          schemas = schemastore.json.schemas(),
          validate = {
            enable = true,
          },
        },
      },
    }))
  end,
}
