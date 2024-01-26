return {
  setup = function(jsonls, configure)
    local schemastore = require("schemastore")

    jsonls.setup(configure({
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
