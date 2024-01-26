return {
  setup = function(configure)
    local schemastore = require("schemastore")

    require("lspconfig").yamlls.setup(configure({
      settings = {
        yaml = {
          schemas = schemastore.yaml.schemas(),
          schemaStore = {
            enable = false,
            url = "",
          },
        },
      },
    }))
  end,
}
